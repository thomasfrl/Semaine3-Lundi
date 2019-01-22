require_relative '../lib/user'
#jsute un commentaire
describe User do

  before(:each) do
  	# ligne trouvée ici : https://geminstallthat.wordpress.com/2008/08/11/reloading-classes-in-rspec/
  	# qui permet de remettre à zéro la classe. Pratique pour la méthode count, mais pas obligatoire.
    Object.send(:remove_const, 'User')
    load 'user.rb'
  end

	describe 'initializer' do

		it 'creates an user' do
      user = User.new("email@email.com")
      expect(user.class).to eq(User)
		end

		it 'saves @email as instance variable' do
			email = "email@email.com"
			user = User.new(email)
			expect(user.email).to eq(email)
		end

		it 'adds one to the @@count global variable' do
			count = User.count
			user = User.new("email@email.com")
			expect(User.count).to eq(count + 1)
		end
	end



	describe 'instance methods' do

		describe 'change_password' do
			it "changes password to ##ENCRYPTED##" do
				user = User.new("email@email.com")
				password = "some string"
				user.change_password(password)
				expect(user.encrypted_password).to eq("##ENCRYPTED##")
			end
		end

		describe 'show_itself' do
			it "shows itself" do
				user = User.new("email@email.com")
				user.show_itself
				expect do
					user.show_itself
				end.to output("#{user}\n").to_stdout
				# OK celle là est super hard, mais en même temps c'est pas des méthodes que l'on utilise souvent. Solution trouvée ici : https://stackoverflow.com/a/38377720
			end
		end

	end

	describe 'instance variables' do

		describe '@email' do

			it 'can be read' do 
				email = "email@email.com"
				user = User.new(email)
				expect(user.email).to eq(email)
			end

			it 'can be written' do 
				email = "email@email.com"
				user = User.new(email)
				email_2 = "email_2@email.com"
				user.email = email_2
				expect(user.email).not_to eq(email)
				expect(user.email).to eq(email_2)
			end

		end

	end

	describe 'class methods' do

		describe 'self.count' do
			it 'shows the number of users' do 
				user_1 = User.new("email1@email.com")
				user_2 = User.new("email2@email.com")
				user_3 = User.new("email3@email.com")
				expect(User.count).to eq(3)
			end
		end

	end

end