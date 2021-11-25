//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untTipoPagto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fcLabel, ExtCtrls, fcpanel, EMsgDlg, JvComponent, JvEnterTab,
  LMDControl, LMDBaseControl, LMDBaseGraphicButton, LMDCustomShapeButton,
  LMDShapeButton, JvTransBtn, ToolEdit, StdCtrls, DBCtrls, RxLookup, Mask,
  CurrEdit, RXCtrls, JvPanel, JvTransparentPanel;

type
  TfrmTipoPgto = class(TForm)
    pnTop: TfcPanel;
    fcLabel2: TfcLabel;
    pnBotoes: TfcPanel;
    pnCentro: TfcPanel;
    JvEnterAsTab1: TJvEnterAsTab;
    btnDinheiro: TLMDShapeButton;
    btnCheque: TLMDShapeButton;
    btnCartao: TLMDShapeButton;
    btnDeposito: TLMDShapeButton;
    PanelCartao: TPanel;
    RxLabel10: TRxLabel;
    RxLabel14: TRxLabel;
    edtVlPagoCar: TCurrencyEdit;
    cmblkCartao: TRxLookupEdit;
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
    edtValorCheq: TCurrencyEdit;
    CheckPre: TCheckBox;
    dbBomPara: TDateEdit;
    dbNumChe: TEdit;
    PanelDep: TPanel;
    RxLabel13: TRxLabel;
    RxLabel11: TRxLabel;
    RxLabel12: TRxLabel;
    edtVlPagoDep: TCurrencyEdit;
    PanelDinh: TPanel;
    RxLabel1: TRxLabel;
    edtVlTotalDin: TCurrencyEdit;
    PanelFrente: TPanel;
    btnConfirmar: TJvTransparentButton;
    btnCancelar: TJvTransparentButton;
    JvTransparentPanel1: TJvTransparentPanel;
    JvTransparentPanel2: TJvTransparentPanel;
    JvTransparentPanel3: TJvTransparentPanel;
    JvTransparentPanel4: TJvTransparentPanel;
    dbLookBanc: TDBEdit;
    dbAgencia: TDBEdit;
    dbNumConta: TRxLookupEdit;
    edtNumBanco: TEdit;
    edtNumConta: TEdit;
    MsgDlg: TEvMsgDlg;
    JvTransparentPanel5: TJvTransparentPanel;
    JvTransparentPanel6: TJvTransparentPanel;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnDinheiroClick(Sender: TObject);
    procedure btnChequeClick(Sender: TObject);
    procedure btnCartaoClick(Sender: TObject);
    procedure btnDepositoClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure RecDin;
    procedure RecCar;
    procedure edtVlPagoDinExit(Sender: TObject);
    procedure CheckPreClick(Sender: TObject);
    procedure cmblkBancoDepExit(Sender: TObject);
    procedure cmblkCartaoExit(Sender: TObject);
  private
    { Private declarations }
    fPagoStt:string;
  public
    { Public declarations }
    Property PagoStt:string Read fPagoStt Write fPagoStt;
  end;

var
  frmTipoPgto             : TfrmTipoPgto;
  TipoPag                 : String      ;
  iPerc,Resto             : real        ;
  ano,mes,dia             : word        ;
  mesCusto,anoCusto,Custo : string      ;

implementation

uses untCPagar, untdmDados;

{$R *.dfm}

procedure TfrmTipoPgto.btnCancelarClick(Sender: TObject);
begin
  PagoStt := 'N';
  Close;
end;

procedure TfrmTipoPgto.btnDinheiroClick(Sender: TObject);
begin
  PanelFrente.Visible := False;
  PanelDinh.Visible   := True ;
  PanelCheq.Visible   := False;
  PanelCartao.Visible := False;
  PanelDep.Visible    := False;
  TipoPag := 'Din';
  edtVlTotalDin.Value:=FrmCPagar.dbVlPago.Value;
end;

procedure TfrmTipoPgto.btnChequeClick(Sender: TObject);
begin
  PanelFrente.Visible := False;
  PanelDinh.Visible   := False;
  PanelCheq.Visible   := True ;
  PanelCartao.Visible := False;
  PanelDep.Visible    := False;
  TipoPag := 'Che';
  edtValorCheq.Value:=frmCpagar.dbVlPago.Value;
end;

procedure TfrmTipoPgto.btnCartaoClick(Sender: TObject);
begin
  PanelFrente.Visible := False;
  PanelDinh.Visible   := False;
  PanelCheq.Visible   := False;
  PanelCartao.Visible := True ;
  PanelDep.Visible    := False;
  TipoPag := 'Car';
  edtVlPagoCar.Value:=frmCPagar.dbVlPago.Value;
end;

procedure TfrmTipoPgto.btnDepositoClick(Sender: TObject);
begin
  PanelFrente.Visible := False;
  PanelDinh.Visible   := False;
  PanelCheq.Visible   := False;
  PanelCartao.Visible := False;
  PanelDep.Visible    := True ;
  TipoPag := 'Dep';
  edtVlPagoDep.Value:=frmCPagar.dbVlPago.Value;
end;

procedure TfrmTipoPgto.btnConfirmarClick(Sender: TObject);
begin
  PagoStt := 'S';
  if (TipoPag = 'Din') then
    RecDin; //pagamento padr�o
  if (TipoPag = 'Car') then
    RecCar; //pagamento padr�o
  if (TipoPag = 'Che') then
    begin
    //registrar o movimento de Cheque
    if CheckPre.Checked then
      begin
      dmDados.tbChequePro.Append;
      dmDados.tbChequeProConta.Value      := dbNumConta.Text             ;
      dmDados.tbChequeProCodFor.Value     := dmDados.tbCPagarCodFor.Value;
      dmDados.tbChequeProValor.Value      := FrmCPagar.dbVlPago.Value    ;
      dmDados.tbChequeProVencimento.Value := dbBomPara.Date              ;
      dmDados.tbChequeProPreDatado.Value  := 'S'                         ;
      dmDados.tbChequeProStatus.Value     := 'ABERTO'                    ;
      dmDados.tbChequeProNumCheque.Value  := StrToFloat(dbNumChe.Text)  ;
      dmDados.tbChequePro.Post;
      end;
    if Not CheckPre.Checked then
      begin
      dmDados.TbMovConta.Append;
      dmDados.TbMovContaDosNumero.Value := dmDados.tbCPagarNumDoc.Value            ;
      dmDados.TbMovContaConta.Value     := dbNumConta.Text                         ;
      dmDados.TbMovContaDataMov.Value   := FrmCPagar.dbDtPgto.Date                 ;
      dmDados.tbMovContaDataReg.value   := Date                                    ;
      dmDados.TbMovContaHoraReg.Value   := Time                                    ;
      dmDados.TbMovContaTipoOper.Value  := 'S'                                     ;
      dmDados.TbMovContaCodHist.Value   := dmDados.tbCPagarCodHist.Value           ;
      dmDados.TbMovContaCodDoc.Value    := dmDados.tbCPagarCodDoc.Value            ;
      dmDados.TbMovContaComplHist.Value := 'Pagamento em Cheque n� '+dbNumChe.Text;
      dmDados.TbMovContaValor.Value     := FrmCPagar.dbVlPago.Value                ;
      dmDados.TbMovConta.Post;
      {atualizar conta corrente}
      if dmDados.TbCCorrente.Locate('Conta',dbNumConta.Text,[]) then
        begin
        dmDados.TbCCorrente.Edit;
        dmDados.TbCCorrenteSaldo.Value  := dmDados.TbCCorrenteSaldo.Value -
                                           FrmCPagar.dbVlPago.Value       ;
        dmDados.tbccorrenteUltMov.value := Date;
        dmDados.TbCCorrente.post;
        end;
      end;
    end;
  if (TipoPag = 'Dep') then
    begin
    dmdados.TbMovConta.Append;
    dmdados.TbMovContaDosNumero.Value := dmdados.tbCPagarNumDoc.Value;
    dmdados.TbMovContaConta.Value     := '000000000000001';
    dmdados.TbMovContaDataMov.Value   := frmCPagar.dbDtPgto.Date;
    dmdados.tbMovContaDataReg.value   := date;
    dmdados.TbMovContaHoraReg.Value   := time;
    dmdados.TbMovContaTipoOper.Value  := 'S';
    dmdados.TbMovContaCodHist.Value   := dmdados.tbCPagarCodHist.Value;
    dmdados.TbMovContaCodDoc.Value    := dmdados.tbCPagarCodDoc.Value;
    dmdados.TbMovContaComplHist.Value := 'Dep.: '+edtNumBanco.Text+'/'+edtNumConta.Text;
    dmdados.TbMovContaValor.Value     := frmCPagar.dbVlPago.Value;
    dmdados.TbMovConta.Post;
    {atualizar conta corrente}
    if dmdados.TbCCorrente.Locate('Conta','000000000000001',[]) then
      begin
      dmdados.TbCCorrente.Edit;
      dmdados.TbCCorrenteSaldo.Value  := dmDados.TbCCorrenteSaldo.Value - frmCPagar.dbVlPago.Value;
      dmdados.tbccorrenteUltMov.value := Date;
      dmdados.TbCCorrente.post;
      end;
    end;
  Close;
end;

procedure TFrmTipoPgto.RecDin;
begin
  {Lan�amento Caixa Empresa}
  dmdados.TbMovConta.Append;
  dmdados.TbMovContaDosNumero.Value := dmdados.tbCPagarNumDoc.Value;
  dmdados.TbMovContaConta.Value     := '000000000000001';
  dmdados.TbMovContaDataMov.Value   := frmCPagar.dbDtPgto.Date;
  dmdados.tbMovContaDataReg.value   := date;
  dmdados.TbMovContaHoraReg.Value   := time;
  dmdados.TbMovContaTipoOper.Value  := 'S';
  dmdados.TbMovContaCodHist.Value   := dmdados.tbCPagarCodHist.Value;
  dmdados.TbMovContaCodDoc.Value    := dmdados.tbCPagarCodDoc.Value;
  dmdados.TbMovContaComplHist.Value := dmDados.tbCPagarCompHist.Value;
  dmdados.TbMovContaValor.Value     := frmCPagar.dbVlPago.Value;
  dmdados.TbMovConta.Post;
  {atualizar conta corrente}
  if dmdados.TbCCorrente.Locate('Conta','000000000000001',[]) then
    begin
    dmdados.TbCCorrente.Edit;
    dmdados.TbCCorrenteSaldo.Value  := dmDados.TbCCorrenteSaldo.Value - frmCPagar.dbVlPago.Value;
    dmdados.tbccorrenteUltMov.value := Date;
    dmdados.TbCCorrente.post;
    end;
end;

procedure TFrmTipoPgto.RecCar;
begin
  dmdados.TbMovConta.Append;
  dmdados.TbMovContaDosNumero.Value :=dmdados.tbCPagarNumDoc.Value;
  dmdados.TbMovContaConta.Value     :='000000000000001';
  dmdados.TbMovContaDataMov.Value   :=frmCPagar.dbDtPgto.Date;
  dmdados.tbMovContaDataReg.value   :=date;
  dmdados.TbMovContaHoraReg.Value   :=time;
  dmdados.TbMovContaTipoOper.Value  :='S';
  dmdados.TbMovContaCodHist.Value   :=dmdados.tbCPagarCodHist.Value;
  dmdados.TbMovContaCodDoc.Value    :=dmdados.tbCPagarCodDoc.Value;
  dmdados.TbMovContaComplHist.Value :='Cart�o: '+dmDados.tbCartaoCartao.Value;
  dmdados.TbMovContaValor.Value     :=frmCPagar.dbVlPago.Value;
  dmdados.TbMovConta.Post;
  {atualizar conta corrente}
  if dmdados.TbCCorrente.Locate('Conta','000000000000001',[]) then
    begin
    dmdados.TbCCorrente.Edit;
    dmdados.TbCCorrenteSaldo.Value  := dmDados.TbCCorrenteSaldo.Value-frmCPagar.dbVlPago.Value;
    dmdados.tbccorrenteUltMov.value := date;
    dmdados.TbCCorrente.post;
    end;
end;

procedure TfrmTipoPgto.edtVlPagoDinExit(Sender: TObject);
begin
  pnBotoes.SetFocus;
end;

procedure TfrmTipoPgto.CheckPreClick(Sender: TObject);
begin
  if CheckPre.Checked then
    dbBomPara.Enabled:=True;
end;

procedure TfrmTipoPgto.cmblkBancoDepExit(Sender: TObject);
begin
  pnBotoes.SetFocus;
end;

procedure TfrmTipoPgto.cmblkCartaoExit(Sender: TObject);
begin
  pnBotoes.SetFocus;
end;

end.






