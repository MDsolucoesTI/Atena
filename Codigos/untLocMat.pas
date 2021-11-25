//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untLocMat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EMsgDlg, fcButton, fcImgBtn, StdCtrls, Grids, DBGrids, RXDBCtrl,
  JvLabel, RXCtrls, RackCtls, JvComponent, JvEnterTab, fcLabel,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel, JvTransBtn, ExtCtrls, fcpanel;

type
  TfrmLocMat = class(TForm)
    pnTop: TLMDBackPanel;
    fcLabel1: TfcLabel;
    JvEnterAsTab1: TJvEnterAsTab;
    pnCentro: TLMDBackPanel;
    JvLabel13: TJvLabel;
    JvLabel1: TJvLabel;
    Cmbcampo: TComboBox;
    GridMat: TRxDBGrid;
    EdtCampo: TEdit;
    EdtValor: TEdit;
    RxLabel2: TRxLabel;
    LEDButton1: TLEDButton;
    pnBotoes: TfcPanel;
    btnLocalizar: TJvTransparentButton;
    btnSair: TJvTransparentButton;
    MsgDlg: TEvMsgDlg;
    procedure fclSairClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocMat: TfrmLocMat;

implementation

{$R *.dfm}

procedure TfrmLocMat.fclSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmLocMat.btnSairClick(Sender: TObject);
begin
  Close;
end;

end.
