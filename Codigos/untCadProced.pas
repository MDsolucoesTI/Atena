//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadProced;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fcLabel, ExtCtrls, fcpanel, JvComponent, JvTransBtn, fcButton,
  fcImgBtn, StdCtrls, JvLabel, RxLookup, EMsgDlg, JvEnterTab, Mask, DBCtrls,
  Grids, DBGrids, RXDBCtrl;

type
  TfrmCadProced = class(TForm)
    pnTop: TfcPanel;
    fcLabel2: TfcLabel;
    fcPanel1: TfcPanel;
    fcPanel2: TfcPanel;
    cmbLkConv: TRxDBLookupCombo;
    JvLabel19: TJvLabel;
    btnCadConv: TfcImageBtn;
    MsgDlg: TEvMsgDlg;
    JvEnterAsTab2: TJvEnterAsTab;
    JvLabel10: TJvLabel;
    JvLabel1: TJvLabel;
    btnProced: TfcImageBtn;
    dbProced: TDBEdit;
    GridBanco: TRxDBGrid;
    dbCateg: TDBEdit;
    fcImageBtn1: TfcImageBtn;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnCadConvClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadProced: TfrmCadProced;

implementation

uses untCadConv;

{$R *.dfm}

procedure TfrmCadProced.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadProced.btnCadConvClick(Sender: TObject);
begin
  frmCadConv:=TfrmCadConv.create(application);
  frmCadConv.ShowModal;
end;

end.
