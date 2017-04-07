module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    class << self
      def search( query )
        # etc
      end
    end
    begin
      client.perform_request 'GET', 'foo/bar/1'
    rescue Elasticsearch::Transport::Transport::Error => e  
      puts e
    end

  end
end