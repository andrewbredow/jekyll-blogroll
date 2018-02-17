module Jekyll
  module Commands
    class Blogroll < Command
      def self.init_with_program(prog)
        prog.command(:blogroll) do |c|
          c.action do
            Jekyll.logger.info("Hello")
          end
        end
      end
    end
  end
end
