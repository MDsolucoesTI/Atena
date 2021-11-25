//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untLocCReceber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EMsgDlg, JvTransBtn, StdCtrls, Grids, DBGrids, RXDBCtrl,
  RackCtls, RXCtrls, JvComponent, JvEnterTab, fcLabel, ExtCtrls, fcpanel;

type
  TfrmLocCReceber = class(TForm)
    pnTop: TfcPanel;
    fcLabel2: TfcLabel;
    JvEnterAsTab1: TJvEnterAsTab;
    pnCentro: TfcPanel;
    RxLabel3: TRxLabel;
    RxLabel1: TRxLabel;
    LEDButton1: TLEDButton;
    RxLabel2: TRxLabel;
    Cmbcampo: TComboBox;
    RxDBGrid1: TRxDBGrid;
    EdtValor: TEdit;
    EdtCampo: TEdit;
    pnBotoes: TfcPanel;
    btnLocalizar: TJvTransparentButton;
    btnSair: TJvTransparentButton;
    MsgDlg: TEvMsgDlg;
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocCReceber: TfrmLocCReceber;

implementation

{$R *.dfm}

procedure TfrmLocCReceber.btnSairClick(Sender: TObject);
begin
  Close;
end;

end.
