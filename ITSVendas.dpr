program ITSVendas;

uses
  Vcl.Forms,
  frmPrincipal.View in 'Src\View\frmPrincipal.View.pas' {fmrPrincipal},
  uLogin.Controller in 'Src\Controller\uLogin.Controller.pas',
  UnitTelaDeInicio in 'Src\View\UnitTelaDeInicio.pas' {frmTelaDeInicio},
  Vcl.Loading in 'Src\Ultils\Vcl.Loading.pas',
  UnitSection.Controller in 'Src\Controller\UnitSection.Controller.pas';
  //UnitProdutos in 'Src\View\UnitProdutos.pas' {frmProdutos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmrPrincipal, fmrPrincipal);
 // Application.CreateForm(TfrmProdutos, frmProdutos);
  Application.Run;
end.
