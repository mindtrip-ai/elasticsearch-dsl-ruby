# Licensed to Elasticsearch B.V. under one or more contributor
# license agreements. See the NOTICE file distributed with
# this work for additional information regarding copyright
# ownership. Elasticsearch B.V. licenses this file to you under
# the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

module Elasticsearch
  module DSL
    module Search
      module Queries

        # A query which allows to customize the score of documents matching the query,
        # via a custom script
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-script-score-query.html
        #
        class Knn
          include BaseComponent

          option_method :k, lambda { |*args| @hash[self.name.to_sym][@args].update k: args.pop }
          option_method :vector, lambda { |*args| @hash[self.name.to_sym][@args].update vector: args.pop }

          # DSL method for building the `query` part of the query definition
          #
          # @return [self]
          #
          def query(*args, &block)
            @query = block ? @query = Query.new(*args, &block) : args.first
            self
          end

          def filter(*args, &block)
            @hash[name][@args][:filter] ||= {}
            if filter = block ? Filter.new(*args, &block) : args.first
              @hash[name][@args][:filter].merge! filter.to_hash
            end
            self
          end

          # Converts the query definition to a Hash
          #
          # @return [Hash]
          #
          def to_hash
            hash = super
            if @query
              _query = @query.respond_to?(:to_hash) ? @query.to_hash : @query
              hash[self.name].update(query: _query)
            end
            hash
          end
        end

      end
    end
  end
end
