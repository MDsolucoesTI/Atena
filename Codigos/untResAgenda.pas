//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untResAgenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fcButton, fcImgBtn, RXCtrls, jpeg, ExtCtrls, StdCtrls, DBCtrls,
  Mask, ToolEdit, RXDBCtrl, CurrEdit, EnhEdit, fcImager, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel,
  fcpanel, JvLabel, JvComponent, JvTransBtn, EMsgDlg;

type
  TfrmResAgenda = class(TForm)
    Panel4: TPanel;
    Panel3: TPanel;
    RxLabel2: TRxLabel;
    RxLabel3: TRxLabel;
    EnhancedEdit1: TEnhancedEdit;
    EnhancedEdit2: TEnhancedEdit;
    Panel5: TPanel;
    RxLabel7: TRxLabel;
    EnhancedEdit3: TEnhancedEdit;
    EnhancedEdit4: TEnhancedEdit;
    Panel6: TPanel;
    RxLabel10: TRxLabel;
    Panel7: TPanel;
    RxLabel11: TRxLabel;
    EnhancedEdit5: TEnhancedEdit;
    EnhancedEdit6: TEnhancedEdit;
    Panel8: TPanel;
    RxLabel14: TRxLabel;
    Panel9: TPanel;
    RxLabel15: TRxLabel;
    EnhancedEdit7: TEnhancedEdit;
    EnhancedEdit8: TEnhancedEdit;
    Panel10: TPanel;
    RxLabel18: TRxLabel;
    Panel11: TPanel;
    RxLabel19: TRxLabel;
    EnhancedEdit9: TEnhancedEdit;
    EnhancedEdit10: TEnhancedEdit;
    Panel12: TPanel;
    RxLabel22: TRxLabel;
    Panel13: TPanel;
    RxLabel23: TRxLabel;
    EnhancedEdit11: TEnhancedEdit;
    EnhancedEdit12: TEnhancedEdit;
    Panel14: TPanel;
    RxLabel26: TRxLabel;
    Bevel1: TBevel;
    EnhancedEdit13: TEnhancedEdit;
    EnhancedEdit14: TEnhancedEdit;
    Panel17: TPanel;
    RxLabel32: TRxLabel;
    EnhancedEdit15: TEnhancedEdit;
    EnhancedEdit16: TEnhancedEdit;
    Panel19: TPanel;
    RxLabel36: TRxLabel;
    Bevel2: TBevel;
    EnhancedEdit17: TEnhancedEdit;
    EnhancedEdit18: TEnhancedEdit;
    EnhancedEdit19: TEnhancedEdit;
    EnhancedEdit20: TEnhancedEdit;
    Panel21: TPanel;
    RxLabel43: TRxLabel;
    EnhancedEdit21: TEnhancedEdit;
    EnhancedEdit22: TEnhancedEdit;
    Panel23: TPanel;
    RxLabel47: TRxLabel;
    EnhancedEdit23: TEnhancedEdit;
    EnhancedEdit24: TEnhancedEdit;
    Panel25: TPanel;
    RxLabel51: TRxLabel;
    EnhancedEdit25: TEnhancedEdit;
    EnhancedEdit26: TEnhancedEdit;
    Panel27: TPanel;
    RxLabel55: TRxLabel;
    EnhancedEdit27: TEnhancedEdit;
    EnhancedEdit28: TEnhancedEdit;
    Panel15: TPanel;
    RxLabel29: TRxLabel;
    EnhancedEdit29: TEnhancedEdit;
    EnhancedEdit30: TEnhancedEdit;
    Panel16: TPanel;
    RxLabel35: TRxLabel;
    EnhancedEdit31: TEnhancedEdit;
    EnhancedEdit32: TEnhancedEdit;
    Panel18: TPanel;
    RxLabel50: TRxLabel;
    EnhancedEdit33: TEnhancedEdit;
    EnhancedEdit34: TEnhancedEdit;
    Panel20: TPanel;
    RxLabel59: TRxLabel;
    EnhancedEdit35: TEnhancedEdit;
    EnhancedEdit36: TEnhancedEdit;
    Panel22: TPanel;
    RxLabel62: TRxLabel;
    EnhancedEdit37: TEnhancedEdit;
    EnhancedEdit38: TEnhancedEdit;
    Panel24: TPanel;
    RxLabel65: TRxLabel;
    Bevel3: TBevel;
    EnhancedEdit39: TEnhancedEdit;
    EnhancedEdit40: TEnhancedEdit;
    EnhancedEdit41: TEnhancedEdit;
    EnhancedEdit42: TEnhancedEdit;
    RxLabel70: TRxLabel;
    RxLabel71: TRxLabel;
    RxLabel72: TRxLabel;
    RxLabel73: TRxLabel;
    RxLabel74: TRxLabel;
    RxLabel75: TRxLabel;
    RxLabel76: TRxLabel;
    RxLabel77: TRxLabel;
    RxLabel78: TRxLabel;
    RxLabel79: TRxLabel;
    RxLabel80: TRxLabel;
    RxLabel81: TRxLabel;
    RxLabel82: TRxLabel;
    RxLabel83: TRxLabel;
    RxLabel84: TRxLabel;
    RxLabel85: TRxLabel;
    RxLabel86: TRxLabel;
    RxLabel87: TRxLabel;
    RxLabel88: TRxLabel;
    Panel26: TPanel;
    RxLabel89: TRxLabel;
    RxLabel92: TRxLabel;
    EnhancedEdit43: TEnhancedEdit;
    EnhancedEdit44: TEnhancedEdit;
    Panel28: TPanel;
    RxLabel93: TRxLabel;
    RxLabel96: TRxLabel;
    EnhancedEdit45: TEnhancedEdit;
    EnhancedEdit46: TEnhancedEdit;
    Panel29: TPanel;
    RxLabel97: TRxLabel;
    RxLabel100: TRxLabel;
    EnhancedEdit47: TEnhancedEdit;
    EnhancedEdit48: TEnhancedEdit;
    Panel30: TPanel;
    RxLabel101: TRxLabel;
    RxLabel104: TRxLabel;
    EnhancedEdit49: TEnhancedEdit;
    EnhancedEdit50: TEnhancedEdit;
    Panel31: TPanel;
    RxLabel105: TRxLabel;
    RxLabel108: TRxLabel;
    EnhancedEdit51: TEnhancedEdit;
    EnhancedEdit52: TEnhancedEdit;
    Panel32: TPanel;
    RxLabel109: TRxLabel;
    Bevel4: TBevel;
    RxLabel114: TRxLabel;
    EnhancedEdit53: TEnhancedEdit;
    EnhancedEdit54: TEnhancedEdit;
    EnhancedEdit55: TEnhancedEdit;
    EnhancedEdit56: TEnhancedEdit;
    Panel33: TPanel;
    RxLabel115: TRxLabel;
    RxLabel118: TRxLabel;
    EnhancedEdit57: TEnhancedEdit;
    EnhancedEdit58: TEnhancedEdit;
    Panel34: TPanel;
    RxLabel119: TRxLabel;
    RxLabel122: TRxLabel;
    EnhancedEdit59: TEnhancedEdit;
    EnhancedEdit60: TEnhancedEdit;
    Panel35: TPanel;
    RxLabel123: TRxLabel;
    RxLabel126: TRxLabel;
    EnhancedEdit61: TEnhancedEdit;
    EnhancedEdit62: TEnhancedEdit;
    Panel36: TPanel;
    Panel37: TPanel;
    Panel38: TPanel;
    RxLabel141: TRxLabel;
    RxLabel142: TRxLabel;
    RxLabel143: TRxLabel;
    pnTop: TfcPanel;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    RxLabel1: TRxLabel;
    RxLabel4: TRxLabel;
    JvLabel3: TJvLabel;
    JvLabel4: TJvLabel;
    JvLabel5: TJvLabel;
    JvLabel6: TJvLabel;
    JvLabel7: TJvLabel;
    JvLabel8: TJvLabel;
    JvLabel9: TJvLabel;
    JvLabel10: TJvLabel;
    JvLabel11: TJvLabel;
    JvLabel12: TJvLabel;
    JvLabel13: TJvLabel;
    JvLabel14: TJvLabel;
    JvLabel15: TJvLabel;
    JvLabel16: TJvLabel;
    JvLabel17: TJvLabel;
    JvLabel18: TJvLabel;
    JvLabel19: TJvLabel;
    JvLabel20: TJvLabel;
    JvLabel21: TJvLabel;
    JvLabel22: TJvLabel;
    JvLabel23: TJvLabel;
    JvLabel24: TJvLabel;
    JvLabel25: TJvLabel;
    JvLabel26: TJvLabel;
    JvLabel27: TJvLabel;
    JvLabel28: TJvLabel;
    JvLabel29: TJvLabel;
    JvLabel30: TJvLabel;
    JvLabel31: TJvLabel;
    JvLabel32: TJvLabel;
    JvLabel33: TJvLabel;
    JvLabel34: TJvLabel;
    JvLabel35: TJvLabel;
    JvLabel36: TJvLabel;
    JvLabel37: TJvLabel;
    JvLabel38: TJvLabel;
    JvLabel39: TJvLabel;
    JvLabel40: TJvLabel;
    JvLabel41: TJvLabel;
    JvLabel42: TJvLabel;
    JvLabel43: TJvLabel;
    JvLabel44: TJvLabel;
    JvLabel45: TJvLabel;
    JvLabel46: TJvLabel;
    JvLabel47: TJvLabel;
    JvLabel48: TJvLabel;
    JvLabel49: TJvLabel;
    JvLabel50: TJvLabel;
    JvLabel51: TJvLabel;
    JvLabel52: TJvLabel;
    JvLabel53: TJvLabel;
    JvLabel54: TJvLabel;
    JvLabel55: TJvLabel;
    JvLabel56: TJvLabel;
    JvLabel57: TJvLabel;
    JvLabel58: TJvLabel;
    JvLabel59: TJvLabel;
    JvLabel60: TJvLabel;
    JvLabel61: TJvLabel;
    JvLabel62: TJvLabel;
    btnSair: TJvTransparentButton;
    MsgDlg: TEvMsgDlg;
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmResAgenda: TfrmResAgenda;

implementation

{$R *.dfm}

procedure TfrmResAgenda.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmResAgenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

end.
