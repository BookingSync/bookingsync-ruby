module BookingSync
  module Pagination
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def find_all_across_pages(options = {})
        records = []
        each(options) { |record| records << record }
        records
      end

      # This only is usefull for bookings, but should be safely ignored by other classes
      def find_all_across_pages_from(time)
        find_all_across_pages(:params => { :from => time.utc.strftime("%Y%m%d") })
      end

      private

      def each(options = {})
        options[:params] ||= {}
        options[:params][:page] = 1
        options[:params][:per_page] = 500

        loop do
          if (records = self.find(:all, options)).try(:any?)
            records.each { |record| yield record }
            options[:params][:page] += 1
          else
            break # no record included on that page, there's no more record
          end
        end
      end
    end
  end
end