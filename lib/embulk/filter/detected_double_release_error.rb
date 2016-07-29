module Embulk
  module Filter

    class DetectedDoubleReleaseError < FilterPlugin
      Plugin.register_filter("detected_double_release_error", self)

      def self.transaction(config, in_schema, &control)
        # configuration code:
        task = {
        }

        columns = [
          Column.new(nil, "example", :string),
        ]

        out_columns = in_schema + columns

        yield(task, out_columns)
      end

      def init
      end

      def close
      end

      def add(page)
        # filtering code:
        add_columns = ["example"]
        page.each do |record|
          page_builder.add(record + add_columns)
          raise ::StandardError.new("error")
        end
      end

      def finish
        page_builder.finish
      end
    end

  end
end
