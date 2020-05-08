class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        has_many :homes, dependent: :destroy
        has_many :books, dependent: :destroy
  		  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship",  dependent: :destroy
  	  	has_many :followings, through: :following_relationships,source: :following
  	  	has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  	  	has_many :followers, through: :follower_relationships,source: :follower

        attachment :profile_image
        validates :name, presence: true, length: { in: 2..20 }
        validates :introduction, length: { maximum: 50 }

        #フォローしているかを確認するメソッド
        def following?(user)
    		  followings.include?(user)
  		  end

      #フォローするときのメソッド
    		 def follow(user)
    		    following_relationships.create!(following_id: user.id)
    		 end

      #フォローを外すときのメソッド
    		 def unfollow(user)
    		    following_relationships.find_by(following_id: user.id).destroy
    		 end
end
