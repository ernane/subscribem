module Subscribem
  class Account < ActiveRecord::Base
    attr_accessible :name, :subdomain, :owner_attributes

    belongs_to :owner, class_name: "Subscribem::User"
    accepts_nested_attributes_for :owner

    has_many :members, class_name: "Subscribem::Member"
    has_many :users,   through: :members

    validates :subdomain, presence: true, uniqueness: true

    def self.create_with_owner(params={})
      account = new(params)
      if account.save
        account.users << account.owner
      end
      account
    end

    def create_schema
      Apartment::Database.create(subdomain)
    end
  end
end
