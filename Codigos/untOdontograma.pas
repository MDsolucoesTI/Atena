//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untOdontograma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fcButton, fcImgBtn, StdCtrls, Mask, DBCtrls, JvLabel, jpeg,
  ExtCtrls, fcpanel, JvComponent, JvTransBtn, Grids, DBGrids, JvEnterTab,
  EMsgDlg;

type
  TfrmOdontograma = class(TForm)
    pnCentro: TfcPanel;
    pnTop: TfcPanel;
    Image1: TImage;
    JvLabel2: TJvLabel;
    dbPac: TDBEdit;
    btnLocPac: TfcImageBtn;
    btnCadCli: TJvTransparentButton;
    btnImagem: TJvTransparentButton;
    btnAnamnese: TJvTransparentButton;
    btnCirurgia: TJvTransparentButton;
    btnDentist: TJvTransparentButton;
    btnPediatria: TJvTransparentButton;
    btnPerio: TJvTransparentButton;
    JvTransparentButton4: TJvTransparentButton;
    JvTransparentButton5: TJvTransparentButton;
    JvTransparentButton6: TJvTransparentButton;
    JvTransparentButton7: TJvTransparentButton;
    JvTransparentButton8: TJvTransparentButton;
    JvTransparentButton9: TJvTransparentButton;
    DBGrid1: TDBGrid;
    JvEnterAsTab1: TJvEnterAsTab;
    MsgDlg: TEvMsgDlg;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOdontograma: TfrmOdontograma;

implementation

{$R *.dfm}

procedure TfrmOdontograma.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

end.
