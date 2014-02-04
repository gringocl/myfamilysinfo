def new
  @kid = kid.find(params[kid:id])
  @Guardian = Guardianship.new(kid:@kid)

  def create
    @Guardianship = Guardianship.create(params)



    add kid
    @kid = Kid.new

  def create
    @Kid = kid(kid_params)
    @guardianship = Guardianship.New {kid: @kid, user: curren_user, role: "Primary", exp: today+10yrs }
    @kid.save
    @guardianship.save
