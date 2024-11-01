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

        # A query which allows to use the `combvined_fields` query
        #
        # @example
        #
        #     search do
        #       query do
        #         combined_fields 
        #           query    'how to fix my printer'
        #           fields   [:title, :abstract, :content]
        #           operator 'and'
        #         end
        #       end
        #     end
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-combined-fields-query.html
        #
        class CombinedFields
          include BaseComponent

          option_method :auto_generate_synonyms_phrase_query
          option_method :fields
          option_method :minimum_should_match
          option_method :operator
          option_method :query
          option_method :zero_terms_query
        end

      end
    end
  end
end
