unit frmPrincipal.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, uLogin.Controller, Vcl.Loading,
  UnitSection.Controller;

type
  TfmrPrincipal = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    lblSenha: TLabel;
    pnlBtnLogin: TPanel;
    Label3: TLabel;
    pnlEmail: TPanel;
    lblEmail: TLabel;
    edtEmail: TEdit;
    Panel3: TPanel;
    edtSenha: TEdit;
    btnLogin: TSpeedButton;
    pnlImage: TPanel;
    procedure btnLoginClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  private

    procedure TerminateLogin(Sender: TObject);
    procedure LidarComLogin;
    { Private declarations }

  public
    { Public declarations }
  end;

var
  fmrPrincipal: TfmrPrincipal;

implementation

{$R *.dfm}

uses UnitTelaDeInicio;

procedure TfmrPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    LidarComLogin;
  end;
end;

procedure TfmrPrincipal.LidarComLogin;
begin
  TLoading.Show(Self);
  TLoading.ExecuteThread(
    procedure
    begin
      Sleep(1000);
    end, TerminateLogin);
end;

procedure TfmrPrincipal.TerminateLogin(Sender: TObject);

var
  User: TLoginController;
  MensagemErro: string;

begin

  TLoading.Hide;
  User := TLoginController.Create(edtEmail.Text, edtSenha.Text);

  if Sender is TThread then
    if Assigned(TThread(Sender).FatalException) then
    begin
      ShowMessage(Exception(TThread(Sender).FatalException).Message);
      exit
    end;

  try
    if not Assigned(frmTelaDeInicio) then
      Application.CreateForm(TfrmTelaDeInicio, frmTelaDeInicio);

    if User.usuarioValido(MensagemErro) then
    begin

      frmTelaDeInicio.Show;
    end
    else
    begin
      ShowMessage(MensagemErro);
    end;

  finally
    User.Free;
  end;
end;

procedure TfmrPrincipal.btnLoginClick(Sender: TObject);

begin
  LidarComLogin;
end;

end.
