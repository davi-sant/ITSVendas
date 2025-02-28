unit UnitProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TfrmProdutos = class(TForm)
    procedure FormResize(Sender: TObject);
  private
  { Private declarations }
    const
    minWidth = 960;
    minHeight = 600;
  public
    { Public declarations }
  end;

var
  frmProdutos: TfrmProdutos;

implementation

{$R *.dfm}
{$REGION 'Sections Events'}

procedure TfrmProdutos.FormResize(Sender: TObject);
begin
  if frmProdutos.Width <= minWidth then
    frmProdutos.Width := minWidth;

  if frmProdutos.Height <= minHeight then
    frmProdutos.Height := minHeight;
end;

{$ENDREGION}

end.
