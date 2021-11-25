//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untLocPatrimonial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EMsgDlg, fcButton, fcImgBtn, StdCtrls, Grids, DBGrids, RXDBCtrl,
  JvLabel, RXCtrls, RackCtls, JvComponent, JvEnterTab, fcLabel,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel;

type
  TfrmLocPatrimonio = class(TForm)
    pnTop: TLMDBackPanel;
    fcLabel1: TfcLabel;
    JvEnterAsTab1: TJvEnterAsTab;
    pnCentro: TLMDBackPanel;
    LEDButton1: TLEDButton;
    RxLabel2: TRxLabel;
    RxLabel7: TRxLabel;
    LEDButton2: TLEDButton;
    JvLabel13: TJvLabel;
    JvLabel1: TJvLabel;
    Cmbcampo: TComboBox;
    GridPatrim: TRxDBGrid;
    EdtCampo: TEdit;
    EdtValor: TEdit;
    btnLocPac: TfcImageBtn;
    fclSair: TfcImageBtn;
    MsgDlg: TEvMsgDlg;
    procedure fclSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocPatrimonio: TfrmLocPatrimonio;

implementation

{$R *.dfm}

procedure TfrmLocPatrimonio.fclSairClick(Sender: TObject);
begin
  Close;
end;

end.
