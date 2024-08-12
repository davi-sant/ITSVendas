unit uLogin.Controller;

interface

uses
  SysUtils, UnitSection.Controller;
type
TLoginController = class
  private
  FEmail: string;
  FSenha: string;
  public
  constructor Create(const Email, Senha: string);
  function usuarioValido(out mensagemErro: string): Boolean;
  property Email: string read FEmail write FEmail;
  property Senha: string read FSenha write FSenha;
end;
implementation

{ TLoginController }

constructor TLoginController.Create(const Email, Senha: string);
begin
  FEmail := email;
  FSenha := Senha;
end;

function TLoginController.usuarioValido(out mensagemErro: string): Boolean;
begin

  if (FEmail = '')  Or (FSenha = '') then
  begin
    mensagemErro := 'Os campos (Email e Senha) não pode ser vazio, por favor preencha.';
    Result := false;
    Exit
  end;

  Result := (FEmail = 'admin') and (FSenha = 'admin');

  if not Result then
      mensagemErro := 'Usuario invalido, revise suas credenciais e tente novamente'
  else
      mensagemErro := '';

end;

end.
