//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadTel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxGrdCpt, fcButton, fcImgBtn, StdCtrls, Mask, DBCtrls, RXCtrls,
  jpeg, ExtCtrls, fcImage, fcimageform, fcImager, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel,
  EMsgDlg, JvEnterTab, JvComponent, JvTransBtn, JvLabel, fcLabel, fcpanel;

type
  TfrmCadTel = class(TForm)
    pnTop: TfcPanel;
    fcLabel2: TfcLabel;
    pnCentro: TfcPanel;
    JvEnterAsTab1: TJvEnterAsTab;
    pnBotoes: TfcPanel;
    btnGravar: TJvTransparentButton;
    btnCancelar: TJvTransparentButton;
    btnDeletar: TJvTransparentButton;
    dbTel: TDBEdit;
    JvLabel4: TJvLabel;
    dbCel: TDBEdit;
    JvLabel5: TJvLabel;
    dbFax: TDBEdit;
    JvLabel6: TJvLabel;
    dbEmail: TDBEdit;
    JvLabel3: TJvLabel;
    dbEnd: TDBEdit;
    JvLabel2: TJvLabel;
    dbNome: TDBEdit;
    JvLabel1: TJvLabel;
    MsgDlg: TEvMsgDlg;
    procedure btnCancelarClick(Sender: TObject);
    procedure dbFaxExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTel: TfrmCadTel;

implementation

{$R *.dfm}

procedure TfrmCadTel.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TfrmCadTel.dbFaxExit(Sender: TObject);
begin
  pnBotoes.SetFocus;
end;

procedure TfrmCadTel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

end.
