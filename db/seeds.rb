# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
u1 = User.create!(username: 'aycelikeshats', password: 'abcd', birthdate: '2000/02/13')
u2 = User.create!(username: 'victorabandonedus', password: 'abcd', birthdate: '1993/03/13')
u3 = User.create!(username: 'kinkastinka', password: 'abcd', birthdate: '1987/04/13')
u4 = User.create!(username: 'spencerdenser', password: 'abcd', birthdate: '1993/05/13')
u5 = User.create!(username: 'jonathonbutt', password: 'abcd', birthdate: '2004/07/13')


Sub.destroy_all
s1 = Sub.create!(title: 'r/hats', moderator_id: u1.id, description: 'Fashion discussion')
s2 = Sub.create!(title: 'r/bloomberg', moderator_id: u2.id, description: 'I am outtie')
s3 = Sub.create!(title: 'r/yall', moderator_id: u1.id, description: 'Southern slang and other fun experiences')
s4 = Sub.create!(title: 'r/TA_Tips', moderator_id: u5.id, description: 'Tips for new TAs please give them to me I am new')

Post.destroy_all
s1_p1 = Post.create!(title: 'My favorite Hat', author_id: u1.id, sub_id: s1.id, url: 'https://cdn10.bigcommerce.com/s-wskkt5d/products/1821/images/8124/whiteley-womens-white-and-black-wide-brim-kentucky-derby-hat-with-bow-655-352__51059.1594546591.1280.1280.jpg?c=2') 
s1_p2 = Post.create!(title: 'Bandanas and You', author_id: u2.id, content: 'Bandanas are controversial and I want to stand against the slander against them', sub_id: s1.id) 
s1_p3 = Post.create!(title: 'Canada Cold Weather Hats', author_id: u3.id, sub_id: s1.id, url: 'https://walkingtheparks.com/best-winter-hiking-hats/') 
s1_p4 = Post.create!(title: 'Hats for Colorado', author_id: u4.id, content: 'Some of my favorite hats for Colorado cold weather', sub_id: s1.id) 
s2_p1 = Post.create!(title: 'Salary Gloating', author_id: u5.id, content: 'I make a lot of money', sub_id: s2.id) 
s2_p2 = Post.create!(title: 'How do deal with Envy', author_id: u1.id, content: 'I wish I was victor', sub_id: s2.id, url: 'https://images.squarespace-cdn.com/content/v1/5846e23b9de4bb2223aa6b3f/1567521070334-S8YLNAURGI22X37W26FG/Envy+Blog+Ice+Cream.jpg?format=1500w') 
s2_p3 = Post.create!(title: '*seething noises*', author_id: u2.id, content: '*grumble*', sub_id: s2.id, url: 'https://media4.giphy.com/media/11tTNkNy1SdXGg/200.gif') 
s3_p1 = Post.create!(title: 'Giddeyup', author_id: u3.id, sub_id: s3.id, url: 'https://media4.giphy.com/media/YSGsgBkBI41a3gJePZ/giphy-downsized-large.gif') 
s3_p2 = Post.create!(title: 'Fried Green Tomatos', author_id: u4.id, sub_id: s3.id, url: 'https://pinchandswirl.com/wp-content/uploads/2017/09/Fried-Green-Tomatoes-Stacked-on-a-white-plate-featured.jpg') 
s3_p3 = Post.create!(title: 'Wheelbarrow', author_id: u5.id, sub_id: s3.id, url: 'https://images.thdstatic.com/productImages/2c8d2c63-2912-4faf-bbb4-f359a859355e/svn/true-temper-wheelbarrows-pw4ut24-64_1000.jpg') 


