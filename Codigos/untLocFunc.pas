//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untLocFunc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jpeg, Grids, DBGrids, RXDBCtrl, StdCtrls, ExtCtrls, RackCtls, fcButton,
  fcImgBtn, RXCtrls, db, LMDCustomComponent, LMDCustomHint,
  LMDCustomShapeHint, LMDShapeHint, RxGrdCpt, fcImager, EMsgDlg,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel, fcLabel, EGrad, JvLabel, JvComponent,
  JvEnterTab;

type
  TfrmLocFunc = class(TForm)
    LMDBackPanel2: TLMDBackPanel;
    LMDBackPanel1: TLMDBackPanel;
    cmbcampo: TComboBox;
    EdtCampo: TEdit;
    edtvalor: TEdit;
    LEDButton1: TLEDButton;
    RxLabel2: TRxLabel;
    RxLabel7: TRxLabel;
    LEDButton2: TLEDButton;
    fclLocFunc: TfcImageBtn;
    RxDBGrid1: TRxDBGrid;
    fclSair: TfcImageBtn;
    fcLabel1: TfcLabel;
    JvLabel13: TJvLabel;
    JvLabel1: TJvLabel;
    MsgDlg: TEvMsgDlg;
    JvEnterAsTab1: TJvEnterAsTab;

  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  frmLocFunc : TfrmLocFunc;


implementation

uses untPrincipal;

{$R *.DFM}

end.


