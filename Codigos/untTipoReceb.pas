//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untTipoReceb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EMsgDlg, JvTransBtn, ToolEdit, StdCtrls, DBCtrls, RxLookup,
  Mask, CurrEdit, RXCtrls, ExtCtrls, LMDControl, LMDBaseControl,
  LMDBaseGraphicButton, LMDCustomShapeButton, LMDShapeButton, JvComponent,
  JvEnterTab, fcLabel, fcpanel, JvCheckBox, JvPanel, JvTransparentPanel;

type
  TfrmTipoReceb = class(TForm)
    pnTop: TfcPanel;
    fcLabel2: TfcLabel;
    JvEnterAsTab1: TJvEnterAsTab;
    pnCentro: TfcPanel;
    btnDinheiro: TLMDShapeButton;
    btnCheque: TLMDShapeButton;
    btnProm: TLMDShapeButton;
    PanelCheq: TPanel;
    RxLabel8: TRxLabel;
    RxLabel7: TRxLabel;
    RxLabel16: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel9: TRxLabel;
    RxLabel3: TRxLabel;
    RxLabel5: TRxLabel;
    RxLabel6: TRxLabel;
    dbNum: TDBEdit;
    edtValor: TCurrencyEdit;
    dbNumAg: TEdit;
    CheckPre: TCheckBox;
    cmblkBanco: TRxLookupEdit;
    dbBomPara: TDateEdit;
    dbNumChe: TEdit;
    dbNumConta: TEdit;
    PanelProm: TPanel;
    RxLabel13: TRxLabel;
    RxLabel12: TRxLabel;
    dbNumProm: TDBEdit;
    edtVlReceb: TCurrencyEdit;
    PanelDinh: TPanel;
    edtVlTotal: TCurrencyEdit;
    PanelFrente: TPanel;
    pnBotoes: TfcPanel;
    btnConfirmar: TJvTransparentButton;
    btnCancelar: TJvTransparentButton;
    edtDinh: TCurrencyEdit;
    edtTroco: TCurrencyEdit;
    RxLabel1: TRxLabel;
    RxLabel4: TRxLabel;
    RxLabel10: TRxLabel;
    JvTransparentPanel1: TJvTransparentPanel;
    JvTransparentPanel2: TJvTransparentPanel;
    MsgDlg: TEvMsgDlg;
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTipoReceb: TfrmTipoReceb;

implementation

{$R *.dfm}

procedure TfrmTipoReceb.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

end.
