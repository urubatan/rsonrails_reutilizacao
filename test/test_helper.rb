ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'test_help'

class Test::Unit::TestCase
  # Transactional fixtures accelerate your tests by wrapping each test method
  # in a transaction that's rolled back on completion.  This ensures that the
  # test database remains unchanged so your fixtures don't have to be reloaded
  # between every test method.  Fewer database queries means faster tests.
  #
  # Read Mike Clark's excellent walkthrough at
  #   http://clarkware.com/cgi/blosxom/2005/10/24#Rails10FastTesting
  #
  # Every Active Record database supports transactions except MyISAM tables
  # in MySQL.  Turn off transactional fixtures in this case; however, if you
  # don't care one way or the other, switching from MyISAM to InnoDB tables
  # is recommended.
  #
  # The only drawback to using transactional fixtures is when you actually
  # need to test transactions.  Since your test is bracketed by a transaction,
  # any transactions started in your code will be automatically rolled back.
  self.use_transactional_fixtures = true

  # Instantiated fixtures are slow, but give you @david where otherwise you
  # would need people(:david).  If you don't want to migrate your existing
  # test cases which use the @david style and don't mind the speed hit (each
  # instantiated fixtures translates to a database query per test method),
  # then set this back to true.
  self.use_instantiated_fixtures  = false

  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def assert_valid_sizes(model_class,small_values,big_values,ok_values)
    obj = model_class.new
    small_values.each do |name,value|
      obj.[]=(name,value)
    end
    assert !obj.valid?, "O modelo #{model_class.name} não devia estar válido agora, foi preenchido com valores muito pequenos"
    small_values.each do |name,value|
      assert obj.errors.invalid?(name), "O atributo #{name} do modelo #{model_class} não deveria ser válido agora, foi preenchido com um valor muito pequeno"
    end
    big_values.each do |name,value|
      obj.[]=(name,value)
    end
    assert !obj.valid?, "O modelo #{model_class.name} não devia estar válido agora, foi preenchido com valores muito grandes"
    big_values.each do |name,value|
      assert obj.errors.invalid?(name), "O atributo #{name} do modelo #{model_class} não deveria ser válido agora, foi preenchido com um valor muito grandes"
    end
    ok_values.each do |name,value|
      obj.[]=(name,value)
    end
    obj.valid?
    ok_values.each do |name,value|
      assert !obj.errors.invalid?(name), "O atributo #{name} do modelo #{model_class} não deveria ser conter de tamanho de valor"
    end
  end

  def assert_unique_values(model_class,invalid_values,valid_values,fields_to_validate)
    obj = model_class.new
    invalid_values.each do |name,value|
      obj.[]=(name,value)
    end
    assert !obj.valid?, "o modelo #{model_class.name} deveria estar inválido agora"
    fields_to_validate.each do |name|
      assert obj.errors.invalid?(name), "O attributo #{name} do modelo #{model_class.name} deveria validar se é unico, mas não validou"
    end
    valid_values.each do |name,value|
      obj.[]=(name,value)
    end
    obj.valid?
    fields_to_validate.each do |name|
      assert !obj.errors.invalid?(name), "O attributo #{name} do modelo #{model_class.name} deveria deveria passar na validação agora, mas não passou"
    end
  end
  def assert_required_values(model_class,valid_values)
    #instanciar o objeto
    obj = model_class.new
    #verificar se os erros ja existem
    assert !obj.valid?, "O modelo #{model_class.name} não passou no teste de vaores requeridos"
    valid_values.each do |attr_name,attr_value|
      assert obj.errors.invalid?(attr_name), "O atributo #{attr_name} do modelo #{model_class.name} não passou na validação de valor requerido"
    end
    #atribuir valores válidos
    valid_values.each do |attr_name,attr_value|
      obj.[]=(attr_name,attr_value)
    end
    #verificar se os erros desapareceram
    obj.valid?
    valid_values.each do |attr_name,attr_value|
      assert !obj.errors.invalid?(attr_name), "O atributo #{attr_name} do modelo #{model_class.name} deveria estar válido agora"
    end
  end
end

