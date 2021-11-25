//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadMedicamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvComponent, JvEnterTab, EMsgDlg, fcLabel, ExtCtrls, fcpanel,
  JvTransBtn, StdCtrls, DBCtrls, RxDBComb, Mask, JvLabel, fcButton,
  fcImgBtn, RxLookup, ComCtrls, LMDFontSizeComboBox, LMDCustomComboBox,
  LMDFontComboBox, LMDBaseGraphicControl, LMDBaseLabel, DB, DBTables,
  LMDCustomSimpleLabel, LMDSimpleLabel, LMDControl, LMDBaseControl,
  LMDBaseGraphicButton, LMDCustomSpeedButton, LMDSpeedButton, ToolWin,
  ImgList;

type
  TfrmCadMedicamento = class(TForm)
    pnTop: TfcPanel;
    fcLabel2: TfcLabel;
    pnCentro: TfcPanel;
    JvEnterAsTab1: TJvEnterAsTab;
    pnBotoes: TfcPanel;
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
    JvLabel2: TJvLabel;
    JvLabel7: TJvLabel;
    JvLabel10: TJvLabel;
    dbQtd: TDBEdit;
    JvLabel1: TJvLabel;
    dbApres: TDBEdit;
    dbNome: TDBEdit;
    JvLabel3: TJvLabel;
    dbCom: TDBEdit;
    JvLabel19: TJvLabel;
    cmbLkTipoMed: TRxDBLookupCombo;
    btnCadTipo: TfcImageBtn;
    btnCadUso: TfcImageBtn;
    JvLabel20: TJvLabel;
    dbObs: TDBMemo;
    cmblkUsoMed: TRxDBLookupCombo;
    btnLocalizar: TJvTransparentButton;
    MsgDlg: TEvMsgDlg;
    dbTexto: TDBRichEdit;
    FontDialog1: TFontDialog;
    ColorDialog1: TColorDialog;
    ImageList2: TImageList;
    pnFonte: TPanel;
    btnDesfazer: TJvTransparentButton;
    cmbFonte: TComboBox;
    cmbTamanho: TComboBox;
    Bevel1: TBevel;
    JvLabel4: TJvLabel;
    JvLabel5: TJvLabel;
    btnFonte: TJvTransparentButton;
    Bevel2: TBevel;
    Bevel3: TBevel;
    btnNegrito: TJvTransparentButton;
    btnItalico: TJvTransparentButton;
    btnSublinhado: TJvTransparentButton;
    btnEsquerda: TJvTransparentButton;
    btnDireita: TJvTransparentButton;
    btnCentro: TJvTransparentButton;
    Bevel4: TBevel;
    procedure btnCadTipoClick(Sender: TObject);
    procedure btnCadUsoClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure dbNomeExit(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure dbObsExit(Sender: TObject);
    procedure btnDesfazerClick(Sender: TObject);
    procedure dbTextoSelectionChange(Sender: TObject);
    procedure dbTextoKeyPress(Sender: TObject; var Key: Char);
    procedure cmbFonteClick(Sender: TObject);
    procedure cmbTamanhoClick(Sender: TObject);
    procedure btnFormatarClick(Sender: TObject);
    procedure btnNegritoClick(Sender: TObject);
    procedure btnItalicoClick(Sender: TObject);
    procedure btnSublinhadoClick(Sender: TObject);
    procedure btnEsquerdaClick(Sender: TObject);
    procedure btnCentroClick(Sender: TObject);
    procedure btnDireitaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadMedicamento: TfrmCadMedicamento;
  Alterado : Boolean;

implementation

uses untCadTipoMed, untCadUsoMed, untLocMedic, untdmDados, untPrincipal;

{$R *.dfm}

procedure TfrmCadMedicamento.btnCadTipoClick(Sender: TObject);
begin
  FrmCadTipoMed:=TFrmCadTipoMed.create(application);
  frmCadTipoMed.OutraJan := True;
  FrmCadTipoMed.ShowModal;
end;

procedure TfrmCadMedicamento.btnCadUsoClick(Sender: TObject);
begin
  FrmCadUsoMed:=TFrmCadUsoMed.create(application);
  frmCadUsoMed.OutraJan := True;
  FrmCadUsoMed.Show;
end;

procedure TfrmCadMedicamento.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadMedicamento.btnLocalizarClick(Sender: TObject);
begin
  FrmLocMedic:=TFrmLocMedic.create(application);
  FrmLocMedic.Show;
end;

procedure TfrmCadMedicamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDados.tbMedicamento.Close ;
  dmDados.tbUsoMed.Close;
  dmDados.tbTipoMed.Close;
  frmPrincipal.StatusTeclas(False,'');
  Action := CaFree;
end;

procedure TfrmCadMedicamento.btnPrimeiroClick(Sender: TObject);
begin
  dmDados.tbMedicamento.First;
  BtnPrimeiro.Enabled := False;
  BtnAnterior.Enabled := False;
  BtnProximo.Enabled  := True ;
  BtnUltimo.Enabled   := True ;
  dmDados.vTabStt:=True;
end;

procedure TfrmCadMedicamento.btnAnteriorClick(Sender: TObject);
begin
  dmDados.tbMedicamento.Prior;
  BtnProximo.Enabled := True;
  BtnUltimo.Enabled  := True;
  If DMDados.tbMedicamento.Bof Then
    Begin
    BtnPrimeiro.Enabled := False;
    BtnAnterior.Enabled := False;
    End;
  dmDados.vTabStt:=True;
end;

procedure TfrmCadMedicamento.btnProximoClick(Sender: TObject);
begin
  dmDados.tbMedicamento.Next;
  BtnPrimeiro.Enabled := True;
  BtnAnterior.Enabled := True;
  If DMDados.tbMedicamento.Eof Then
    Begin
    BtnProximo.Enabled := False;
    BtnUltimo.Enabled := False;
    End;
  dmDados.vTabStt:=True;
end;

procedure TfrmCadMedicamento.btnUltimoClick(Sender: TObject);
begin
  dmDados.tbMedicamento.Last;
  BtnPrimeiro.Enabled := True ;
  BtnAnterior.Enabled := True ;
  BtnProximo.Enabled  := False;
  BtnUltimo.Enabled   := False;
  dmDados.vTabStt:=True;
end;

procedure TfrmCadMedicamento.btnNovoClick(Sender: TObject);
begin
  dmdados.tbMedicamento.Append;
  NovoItem        := True ;
  dmDados.vTabStt := False;
  // AjustaBot�es
  BtnGravar.Enabled    := True ;
  BtnCancelar.Enabled  := True ;
  BtnNovo.Enabled      := False;
  BtnPrimeiro.Enabled  := False;
  BtnAnterior.Enabled  := False;
  BtnProximo.Enabled   := False;
  BtnUltimo.Enabled    := False;
  BtnAlterar.Enabled   := False;
  BtnDeletar.Enabled   := False;
  // Desabilitando os Componentes
  dbNome.Enabled       := True;
  dbCom.Enabled        := True;
  cmbLkTipoMed.Enabled := True;
  cmblkUsoMed.Enabled  := True;
  dbApres.Enabled      := True;
  dbQtd.Enabled        := True;
  dbObs.Enabled        := True;
  dbTexto.Enabled      := True;
  pnFonte.Enabled      := True;
  btnCadTipo.Enabled   := True;
  btnCadUso.Enabled    := True;
  dbNome.SetFocus;
end;

procedure TfrmCadMedicamento.btnGravarClick(Sender: TObject);
var
  Campos:String;
  Vazio,Gravar:Boolean;
  tabela: ttable;
begin
  Campos :='';
  Gravar :=True;
  Vazio  :=False;
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbMedicamento.DatabaseName;
  Tabela.TableName    := dmDados.tbMedicamento.TableName;
  Tabela.IndexName    := dmdados.tbMedicamento.IndexName;
  Tabela.Open;
	if dbNome.Text='' then
  	begin
    if Length(Campos)>0 then Campos:=Campos+', ';
    Campos:=Campos+'Nome';
    Gravar:=False;
    Vazio:=True;
  	End
  else
    if Tabela.Locate('Nome',dbNome.Text,[]) then
      if not((DmDados.tbMedicamento.State=dsEdit) And (dmDados.tbMedicamento.RecNo = Tabela.RecNo)) then
        begin
        Gravar:=False;
        MsgDlg.MsgWarning('Nome j� cadastrado!');
        dbNome.SetFocus;
        end;
  If Gravar Then
    begin
    dmdados.tbMedicamento.Post;
    NovoItem        := False;
    dmDados.vTabStt := True ;
    // Ajusta Bot�es
    BtnGravar.Enabled   := False;
    BtnCancelar.Enabled := False;
    BtnNovo.Enabled     := True ;
    BtnPrimeiro.Enabled := True ;
    BtnAnterior.Enabled := True ;
    BtnProximo.Enabled  := True ;
    BtnUltimo.Enabled   := True ;
    BtnAlterar.Enabled  := True ;
    Btndeletar.Enabled  := True ;
    // Desabilitando os Componentes
    dbNome.Enabled       := False;
    dbCom.Enabled        := False;
    cmbLkTipoMed.Enabled := False;
    cmblkUsoMed.Enabled  := False;
    dbApres.Enabled      := False;
    dbQtd.Enabled        := False;
    dbObs.Enabled        := False;
    dbTexto.Enabled      := False;
    pnFonte.Enabled      := False;
    btnCadTipo.Enabled   := False;
    btnCadUso.Enabled    := False;
    MsgDlg.MsgInformation('Dados gravados com sucesso!');
    dmDados.tbMedicamento.Refresh;
    pnBotoes.SetFocus;
    end
  else
    begin
    if Vazio then
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
    dbNome.Enabled:=true;
    end;
  tabela.Free;
end;

procedure TfrmCadMedicamento.dbNomeExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbMedicamento.DatabaseName;
  Tabela.TableName    := dmDados.tbMedicamento.TableName   ;
  Tabela.IndexName    := dmdados.tbMedicamento.IndexName   ;
  Tabela.Open;
  if NovoItem then
    if dbNome.Text = '' then
      begin
      MsgDlg.MsgError('� necess�rio Informar o Nome!');
      dbNome.setfocus;
      end
    else
      if Tabela.Locate('Nome',dbNome.Text,[]) then
        if not ((DmDados.tbMedicamento.State=dsEdit) And (dmDados.tbMedicamento.RecNo = Tabela.RecNo)) then
          begin
          MsgDlg.MsgWarning('Nome j� Cadastrado!');
          dbNome.Clear;
          dbNome.setfocus;
          end;
  Tabela.Free;
end;

procedure TfrmCadMedicamento.btnCancelarClick(Sender: TObject);
begin
  dmdados.tbMedicamento.cancel;
  NovoItem        := False;
  dmDados.vTabStt := True ;
 // Ajusta bot�es
  btnGravar.Enabled   := False;
  BtnCancelar.Enabled := False;
  BtnNovo.Enabled     := True ;
  BtnPrimeiro.Enabled := True ;
  BtnAnterior.Enabled := True ;
  BtnProximo.Enabled  := True ;
  BtnUltimo.Enabled   := True ;
  BtnAlterar.Enabled  := True ;
  BtnDeletar.Enabled  := True ;
  pnBotoes.SetFocus;
  // Desabilitando os Componentes
  dbNome.Enabled       := False;
  dbCom.Enabled        := False;
  cmbLkTipoMed.Enabled := False;
  cmblkUsoMed.Enabled  := False;
  dbApres.Enabled      := False;
  dbQtd.Enabled        := False;
  dbObs.Enabled        := False;
  dbTexto.Enabled      := False;
  pnFonte.Enabled      := False;
  btnCadTipo.Enabled   := False;
  btnCadUso.Enabled    := False;
  pnBotoes.SetFocus;
end;

procedure TfrmCadMedicamento.btnAlterarClick(Sender: TObject);
begin
  if dmdados.tbMedicamento.RecordCount=0 then
    MsgDlg.MsgError('Tabela sem registro!!!')
  else
    begin
    NovoItem := True;
    dmdados.tbMedicamento.Edit;
    // Ajusta Bot�es
    BtnCancelar.Enabled  := True ;
    BtnGravar.Enabled    := True ;
    BtnNovo.Enabled      := False;
    BtnPrimeiro.Enabled  := False;
    BtnAnterior.Enabled  := False;
    BtnProximo.Enabled   := False;
    BtnUltimo.Enabled    := False;
    BtnAlterar.Enabled   := False;
    Btndeletar.Enabled   := False;
  // Habilitando os componentes
    dbNome.Enabled       := True;
    dbCom.Enabled        := True;
    cmbLkTipoMed.Enabled := True;
    cmblkUsoMed.Enabled  := True;
    dbApres.Enabled      := True;
    dbQtd.Enabled        := True;
    dbObs.Enabled        := True;
    dbTexto.Enabled      := True;
    pnFonte.Enabled      := True;
    btnCadTipo.Enabled   := True;
    btnCadUso.Enabled    := True;
    dbNome.SetFocus;
    end;
end;

procedure TfrmCadMedicamento.btnDeletarClick(Sender: TObject);
var
  Flag : Boolean;
begin
  Flag := False;
  if (dmDados.tbMedicamento.RecordCount = 0) then
    MsgDlg.MsgError('Tabela vazia')
  else
    if MsgDlg.MsgConfirmation('Tem certeza que deseja excluir este registro?') = id_yes then
      begin
      if (Flag) then
        MsgDlg.MsgInformation('Medicamento ativo, ou com registro de opera��es anteriores, n�o pode ser exclu�do !!!')
      else
        dmDados.tbMedicamento.Delete;
      end
    else
      dmDados.tbMedicamento.cancel;
end;

procedure TfrmCadMedicamento.FormActivate(Sender: TObject);
begin
  frmPrincipal.StatusTeclas(True,' [Insert] Novo [Home] Alterar [End] Gravar [Delete] [F2] Tipos [F3] Uso [F9] Localizar [Del] Excluir [Esc] Cancelar ou Sair');
end;

procedure TfrmCadMedicamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case (key) of
    // Teclas de a��o na tabela
    VK_Insert : if (dmDados.vTabStt) then btnNovo.Click;
    VK_Home   : if (dmDados.vTabStt) then btnAlterar.Click;
    VK_Delete : if (dmDados.vTabStt) then btnDeletar.Click;
    VK_End    : if not(dmDados.vTabStt) then btnGravar.Click;
    VK_ESCAPE : if not(dmDados.vTabStt) then btnCancelar.Click
                else btnSair.Click;
    VK_F2     : btnCadTipo.Click;
    VK_F3     : btnCadUso.Click;
    VK_F9     : btnLocalizar.Click;                
  end;
end;

procedure TfrmCadMedicamento.FormShow(Sender: TObject);
var
  N: integer;
begin
  dmDados.vTabStt := True;
  if (dmDados.tbMedicamento.State = dsInactive) then
    dmDados.tbMedicamento.Open;
  if (dmDados.tbUsoMed.State      = dsInactive) then
    dmDados.tbUsoMed.Open;
  if (dmDados.tbTipoMed.State     = dsInactive) then
    dmDados.tbTipoMed.Open;
  begin
    dbTexto.Align  := alBottom;
    cmbFonte.Items := Screen.Fonts;
    cmbFonte.Text  := 'Times New Roman';
    for N := 1 to 48 do
    Begin
      cmbTamanho.Items.Add(inttostr(N));
    end;
    cmbTamanho.Text   := '12';
    dbTexto.Font.Name := 'Times New Roman';
    dbTexto.Font.Size := 12;
    dbTextoSelectionChange(Sender);
  end;
end;

procedure TfrmCadMedicamento.dbObsExit(Sender: TObject);
begin
  pnBotoes.SetFocus;
end;

procedure TfrmCadMedicamento.btnDesfazerClick(Sender: TObject);
begin
  dbTexto.Undo;
end;

procedure TfrmCadMedicamento.dbTextoSelectionChange(Sender: TObject);
begin
   btnNegrito.Down    := (fsBold in dbTexto.SelAttributes.Style);
   btnItalico.Down    := (fsItalic in dbTexto.SelAttributes.Style);
   btnSublinhado.Down := (fsUnderline in dbTexto.SelAttributes.Style);
   case dbTexto.Paragraph.Alignment of
      taLeftJustify:
          begin
          btnEsquerda.Down := True ;
          btnCentro.Down   := False;
          btnDireita.Down  := False;
          end;
      taCenter:
          begin
          btnCentro.Down   := True ;
          btnEsquerda.Down := False;
          btnDireita.Down  := False;
          end;
      taRightJustify:
          begin
          btnEsquerda.Down := True ;
          btnCentro.Down   := False;
          btnDireita.Down  := False;
          end;
   end;
   cmbFonte.Text   := dbTexto.SelAttributes.Name;
   cmbTamanho.Text := inttostr(dbTexto.SelAttributes.size);
end;

procedure TfrmCadMedicamento.dbTextoKeyPress(Sender: TObject;
  var Key: Char);
begin
    Alterado := True;
end;

procedure TfrmCadMedicamento.cmbFonteClick(Sender: TObject);
begin
  dbTexto.SelAttributes.Name := cmbFonte.Items[cmbFonte.itemindex];
  FontDialog1.Font.Name      := cmbFonte.Items[cmbFonte.itemindex];
  dbTexto.SetFocus;
end;

procedure TfrmCadMedicamento.cmbTamanhoClick(Sender: TObject);
begin
  dbTexto.SelAttributes.Size := StrToInt(cmbTamanho.Items[cmbTamanho.ItemIndex]);
  FontDialog1.Font.Size      := StrToInt(cmbTamanho.Items[cmbTamanho.itemindex]);
  dbTexto.SetFocus;
end;

procedure TfrmCadMedicamento.btnFormatarClick(Sender: TObject);
begin
  FontDialog1.Execute;
  dbTexto.SelAttributes.Color := FontDialog1.Font.Color;
  dbTexto.SelAttributes.Name  := FontDialog1.Font.Name ;
  dbTexto.SelAttributes.Size  := FontDialog1.Font.Size ;
  dbTexto.SelAttributes.Style := FontDialog1.Font.Style;
end;


procedure TfrmCadMedicamento.btnNegritoClick(Sender: TObject);
begin
  if (dbTexto.SelAttributes.Style = [fsbold]) or
     (dbTexto.SelAttributes.Style = [fsbold, fsitalic]) or
     (dbTexto.SelAttributes.Style = [fsbold, fsunderline]) or
     (dbTexto.SelAttributes.Style = [fsbold, fsitalic, fsunderline]) then
  dbTexto.SelAttributes.Style := dbTexto.SelAttributes.Style - [fsbold]
  else
  dbTexto.SelAttributes.Style := dbTexto.SelAttributes.Style + [fsbold];
  dbTextoSelectionChange(Sender);
end;

procedure TfrmCadMedicamento.btnItalicoClick(Sender: TObject);
begin
  if (dbTexto.SelAttributes.Style = [fsitalic]) or
     (dbTexto.SelAttributes.Style = [fsitalic, fsbold]) or
     (dbTexto.SelAttributes.Style = [fsitalic, fsunderline]) or
     (dbTexto.SelAttributes.Style = [fsitalic, fsbold, fsunderline]) then
  dbTexto.SelAttributes.Style := dbTexto.SelAttributes.Style - [fsitalic]
  else
  dbTexto.SelAttributes.Style := dbTexto.SelAttributes.Style + [fsitalic];
  dbTextoSelectionChange(Sender);
end;

procedure TfrmCadMedicamento.btnSublinhadoClick(Sender: TObject);
begin
  if (dbTexto.SelAttributes.Style = [fsunderline]) or
     (dbTexto.SelAttributes.Style = [fsunderline, fsitalic]) or
     (dbTexto.SelAttributes.Style = [fsunderline, fsbold]) or
     (dbTexto.SelAttributes.Style = [fsunderline, fsitalic, fsbold]) then
  dbTexto.SelAttributes.Style := dbTexto.SelAttributes.Style - [fsunderline]
  else
  dbTexto.SelAttributes.Style := dbTexto.SelAttributes.Style + [fsunderline];
  dbTextoSelectionChange(Sender);
end;

procedure TfrmCadMedicamento.btnEsquerdaClick(Sender: TObject);
begin
  dbTexto.Paragraph.Alignment := taLeftJustify;
  dbTextoSelectionChange(Sender);
end;

procedure TfrmCadMedicamento.btnCentroClick(Sender: TObject);
begin
  dbTexto.Paragraph.Alignment := taCenter;
  dbTextoSelectionChange(Sender);
end;

procedure TfrmCadMedicamento.btnDireitaClick(Sender: TObject);
begin
  dbTexto.Paragraph.Alignment := taRightJustify;
  dbTextoSelectionChange(Sender);
end;

end.
