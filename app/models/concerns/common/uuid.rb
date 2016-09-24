module Common
  module Uuid
    extend ActiveSupport::Concern

    included do
      validates :uuid, uniqueness: true

      before_validation :generate_uuid, on: :create

      private

      def generate_uuid(opts={})
        if uuid.blank? || opts[:force] == true
          self.uuid = loop do
            # these uuid-lengths were chosen not very rigorously to balance
            # the total number space with minimizing the
            # number of DB collision checks that are likely to
            # be performed in the generation of a single uuid.
            # A reference table for the number space can be found here:
            # http://thestarman.pcministry.com/asm/6to64bits.htm
            if !defined?(uuid_length)
              _min_uuid_length = defined?(min_uuid_length) ? min_uuid_length : 2

              count_or_1 = self.class.count == 0 ? 1 : self.class.count
              
              # min length is 2:
              uuid_length = [(Math.log((count_or_1 * 4), 16)/2).ceil, _min_uuid_length].max
            end

            random_uuid = SecureRandom.hex(uuid_length)

            # puts "generated UUID for #{self.class}: #{random_uuid}"

            base_scope  = persisted? ? self.class.where.not(id: id) : self.class.all

            break random_uuid if base_scope.where(uuid: random_uuid).size == 0
          end
        end

        true
      end
    end
  end
end
