//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untEnvMens;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fcButton, fcImgBtn, RXCtrls, jpeg, ExtCtrls, ImgList, ComCtrls,
  ToolWin, DCChoice, StdCtrls, Mask, DBCtrls, fcImager, Menus, RxMenus,
  Grids, DBGrids, RXDBCtrl, EMsgDlg;

type
  TfrmEnvioMens = class(TForm)
    Panel2: TPanel;
    ControlBar1: TControlBar;
    StandardToolBar: TToolBar;
    btnNova: TToolButton;
    btnResp: TToolButton;
    ToolButton2: TToolButton;
    btnImprimir: TToolButton;
    ToolButton7: TToolButton;
    btnExcluir: TToolButton;
    btnReceber: TToolButton;
    ToolButton12: TToolButton;
    btnSair: TToolButton;
    ImageList1: TImageList;
    Panel1: TPanel;
    RxLabel4: TRxLabel;
    RxDBGrid1: TRxDBGrid;
    Panel3: TPanel;
    RxLabel2: TRxLabel;
    RxLabel1: TRxLabel;
    RxLabel3: TRxLabel;
    dbDe: TDBText;
    dbPara: TDBText;
    dbAssunto: TDBText;
    dbMens: TDBMemo;
    MsgDlg: TEvMsgDlg;
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEnvioMens: TfrmEnvioMens;

implementation

{$R *.dfm}

procedure TfrmEnvioMens.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmEnvioMens.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

end.
