//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untMarcarCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvComponent, JvEnterTab, fcLabel, ExtCtrls, fcpanel, StdCtrls,
  DBCtrls, RxLookup, RxDBComb, EDBTime, Mask, ToolEdit, RXDBCtrl, RXCtrls,
  EDBFind, JvTransBtn, EMsgDlg, fcButton, fcImgBtn, JvLabel, IBTable,
  ComCtrls, JvDateTimePicker, JvDBDateTimePicker, ELibFnc;

type
  TfrmMarcarCons = class(TForm)
    pnTop: TfcPanel;
    fcLabel1: TfcLabel;
    JvEnterAsTab1: TJvEnterAsTab;
    pnCentro: TfcPanel;
    pnBotoes: TfcPanel;
    RxLabel13: TRxLabel;
    dbData: TDBDateEdit;
    RxLabel8: TRxLabel;
    RxLabel2: TRxLabel;
    dbNome: TDBEdit;
    RxLabel1: TRxLabel;
    dbTel1: TDBEdit;
    RxLabel6: TRxLabel;
    RxLabel5: TRxLabel;
    dbCel: TDBEdit;
    btnConfirmar: TJvTransparentButton;
    btnCancelar: TJvTransparentButton;
    RxLabel9: TRxLabel;
    FindPac: TEvDBFind;
    btnCadRap: TfcImageBtn;
    dbConv: TDBEdit;
    JvLabel20: TJvLabel;
    dbObs: TDBMemo;
    cmblkTipo: TRxDBLookupCombo;
    dbProf: TDBEdit;
    dbHorario: TDBEdit;
    dbStatus: TDBEdit;
    dbPaci: TDBEdit;
    dbHora: TDBEdit;
    EvLibFunctions1: TEvLibFunctions;
    MsgDlg: TEvMsgDlg;
    procedure btnCancelarClick(Sender: TObject);
    procedure lookConvExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FindPacExit(Sender: TObject);
    procedure btnCadRapClick(Sender: TObject);
    procedure cmblkTipoExit(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMarcarCons: TfrmMarcarCons;

implementation

uses untdmDados, untPrincipal, untAgenda, DB, untCadRapid, untCadPac,
  IBCustomDataSet, IBDatabase;

{$R *.dfm}

procedure TfrmMarcarCons.btnCancelarClick(Sender: TObject);
begin
  dmDados.tbAgenda.Cancel;
  Close;
end;

procedure TfrmMarcarCons.lookConvExit(Sender: TObject);
begin
  pnBotoes.SetFocus;
end;

procedure TfrmMarcarCons.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmPrincipal.StatusTeclas(False,'');
  Action := Cafree;
end;

procedure TfrmMarcarCons.FormShow(Sender: TObject);
begin
  frmPrincipal.StatusTeclas(True,'[End] Gravar [Esc] Sair');
  dmdados.tbAgenda.Append;
  dbProf.Text    := dmDados.tbHorarioPRO_CODIGO.AsString                      ;
  dbHorario.Text := dmDados.tbHorarioHOR_CODIGO.AsString                      ;
  dbHora.Text    := frmAgenda.StringAgenda.Cells[0,frmAgenda.StringAgenda.Row];
  dbData.Date    := frmAgenda.Calendario.Date                                 ;
  dbStatus.Text  := 'A'                                                       ;
end;

procedure TfrmMarcarCons.FindPacExit(Sender: TObject);
begin
  if (dmdados.tbPaciente.Locate('PAC_NOME',FindPac.Text,[LoPartialKey])) then
    begin
    dmDados.tbAgendaPAC_CODIGO.Value := dmDados.tbPacientePAC_CODIGO.Value;
    FindPac.Visible := False;
    dbObs.SetFocus;
    end
  else
    begin
    MsgDlg.MsgWarning('Paciente n�o cadastrado');
    btnCadRap.SetFocus;
    end;
end;

procedure TfrmMarcarCons.btnCadRapClick(Sender: TObject);
begin
  frmCadRapid:=TfrmCadRapid.create(application);
  frmCadRapid.ShowModal;
  dmDados.tbPaciente.Refresh;
  dmDados.tbPaciente.Last;
  dmDados.tbAgendaPAC_CODIGO.Value := dmDados.tbPacientePAC_CODIGO.Value;
  dbPaci.Text := IntToStr(dmDados.tbPacientePAC_CODIGO.Value);
  dbNome.SetFocus;
end;

procedure TfrmMarcarCons.cmblkTipoExit(Sender: TObject);
begin
  dmDados.tbTipoAtende.Locate('TIP_TIPO',cmblkTipo.Text,[]);
  if (dmDados.tbTipoAtendeTIP_CADRAP.Value = 'S') then
    begin
    FindPac.Visible := False;
    MsgDlg.MsgInformation('� necess�io Cadastrar o Paciente');
    btnCadRap.Click;
    end
  else
    Begin
    dbNome.Visible  := True ;
    FindPac.Visible := True ;
    FindPac.SetFocus;
    end;
end;

procedure TfrmMarcarCons.btnConfirmarClick(Sender: TObject);
var
  Linha     : integer  ;
  Prazo     : integer  ;
  DtUltCons : TDateTime;
begin
  //filtrar para trazer ultima consulta
  {if (cmblkTipo.Text <> '1a VEZ') then
    begin
    DtUltCons := dmDados.tbPacientePAC_ULTCONS.Value;
    Prazo     := 0                                  ;
    if (dmDados.tbConvenio.Locate('CON_CODIGO',dmDados.tbPacienteCON_CODIGO.Value,[])) then
      Prazo     := StrToInt(dmDados.tbConvenioCON_RETORNO.Value);
    DtUltCons := DtUltCons + Prazo;
    if (dmdados.tbAgendaAGE_DATA.Value <= DtUltCons) then
      begin
      dmdados.tbAgendaTIP_SIGLA.Value := 'R';
      MsgDlg.MsgInformation('O paciente est� com o prazo para retorno');
      end;
    end;}
  dmDados.tbAgenda.Post;
  Linha := frmAgenda.StringAgenda.Row;
  frmAgenda.StringAgenda.Cells[1,linha]      := dmDados.tbAgendaPaciente.Value          ;
  frmAgenda.StringAgenda.Cells[2,linha]      := dmDados.tbAgendaConvenio.Value          ;
  frmAgenda.StringAgenda.Cells[3,linha]      := dmDados.tbAgendaAGE_STATUS.Value        ;
  frmAgenda.StringAgenda.Cells[4,linha]      := dmDados.tbAgendaTipo.Value              ;
  frmAgenda.StringAgenda.FontColors[1,Linha] := StringToColor(StrRTrim(dmDados.tbAgendaCor.Value));
  frmAgenda.StringAgenda.FontColors[2,Linha] := StringToColor(StrRTrim(dmDados.tbAgendaCor.Value));
  frmAgenda.StringAgenda.FontColors[3,Linha] := StringToColor(StrRTrim(dmDados.tbAgendaCor.Value));
  frmAgenda.StringAgenda.FontColors[4,Linha] := StringToColor(StrRTrim(dmDados.tbAgendaCor.Value));
  Close;
end;

end.
