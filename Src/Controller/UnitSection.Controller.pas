unit UnitSection.Controller;

interface

type
  TSessionController = Class

  private
    class var FIdUsuario: integer;
    class var FEmail: string;
    class var FNome: string;

  public
    class property idUsuario: integer read FIdUsuario write FIdUsuario;
    class property email: string read FEmail write FEmail;
    class property nome: string read FNome write FNome;

  end;

implementation

end.