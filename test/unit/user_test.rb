require 'test_helper'
require 'user'

class UserTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_required
    assert_required_values User, :login => "testsaved", :password => "testsaved", :email => "test@test.com"
  end
  
  def test_length
    assert_valid_sizes User, {:login => "a", :password => "a"},{:login => "a" * 101, :password => "a" * 55},{:login => "a" * 90, :password => "a" * 45}
  end
  
  def test_email_format
    u = User.new(:login => "asdas", :password => "asdas", :email => "test", :name => "qualquer nome")
    assert !u.save
    assert u.errors[:email]
    u.email = "test@domain"
    assert !u.save
    assert u.errors[:email]
    u.email = "test@domain.com"
    assert u.save
    assert !u.errors[:email]
  end
  
  def test_uniqueness
    assert_unique_values User, {:login => 'user1', :email => 'user1@domain1.com'}, {:login => '2user1', :email => '2user1@domain1.com'}, [:login,:email]
  end
  
  def test_logon
    assert !User.logon("asda","asda"), "Um login com usuário e senha inválidos não deve funcionar"
    assert !User.logon("user1","asda"), "Um login com usuário válido e senha inválidas não deve funcionar"
    assert User.logon("user1","user1"), "Um login com usuário e senha válidos deve funcionar"
    assert User.logon("user1@domain1.com","user1"), "Um login com email e senha válidos deve funcionar"
  end
end
