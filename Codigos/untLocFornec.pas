//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untLocFornec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EMsgDlg, fcButton, fcImgBtn, StdCtrls, Grids, DBGrids, RXDBCtrl,
  RackCtls, RXCtrls, fcLabel, LMDCustomControl, LMDCustomPanel,  DBTables, DB,
  LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel, JvComponent,
  JvEnterTab;

type
  TfrmLocFornec = class(TForm)
    LMDBackPanel2: TLMDBackPanel;
    fcLabel1: TfcLabel;
    LMDBackPanel1: TLMDBackPanel;
    RxLabel3: TRxLabel;
    RxLabel1: TRxLabel;
    LEDButton1: TLEDButton;
    RxLabel2: TRxLabel;
    RxLabel7: TRxLabel;
    LEDButton2: TLEDButton;
    Cmbcampo: TComboBox;
    GridFornec: TRxDBGrid;
    EdtCampo: TEdit;
    EdtValor: TEdit;
    btnLocFornec: TfcImageBtn;
    btnSair: TfcImageBtn;
    MsgDlg: TEvMsgDlg;
    JvEnterAsTab1: TJvEnterAsTab;
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmLocFornec : TfrmLocFornec;

implementation

uses untPrincipal;

{$R *.dfm}

procedure TfrmLocFornec.btnSairClick(Sender: TObject);
begin
  Close;
end;

end.
