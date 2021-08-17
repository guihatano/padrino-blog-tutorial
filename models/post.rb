# frozen_string_literal: true

# models/post.rb
class Post < Sequel::Model
  many_to_one :account

  plugin :validation_helpers
  def validate
    super
    validates_presence %i[title body]
  end
end
