//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untConfigAnamnese;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EMsgDlg, JvComponent, JvEnterTab, fcLabel, ExtCtrls, fcpanel,
  JvArrowBtn, JvTransBtn, StdCtrls, Mask, DBCtrls, JvLabel;

type
  TfrmConfigAnamnese = class(TForm)
    pnTop: TfcPanel;
    fcLabel2: TfcLabel;
    JvEnterAsTab1: TJvEnterAsTab;
    fcPanel1: TfcPanel;
    fcPanel2: TfcPanel;
    btnPrimeiro: TJvTransparentButton;
    btnAnterior: TJvTransparentButton;
    btnProximo: TJvTransparentButton;
    btnUltimo: TJvTransparentButton;
    btnNovo: TJvTransparentButton;
    btnGravar: TJvTransparentButton;
    btnCancelar: TJvTransparentButton;
    btnAlterar: TJvTransparentButton;
    btnDeletar: TJvTransparentButton;
    btnSair: TJvTransparentButton;
    btnNovaPerg: TJvTransparentButton;
    JvLabel2: TJvLabel;
    dbAnam: TDBEdit;
    MsgDlg: TEvMsgDlg;
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfigAnamnese: TfrmConfigAnamnese;

implementation

{$R *.dfm}

procedure TfrmConfigAnamnese.btnSairClick(Sender: TObject);
begin
  Close;
end;

end.
