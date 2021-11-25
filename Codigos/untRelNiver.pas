//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2008
// Sistema...........: Atena - Automacao Clinica Odontologica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untRelNiver;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvComponent, JvTransBtn, StdCtrls, DCChoice, Mask, ToolEdit,
  RXCtrls, fcLabel, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel;

type
  TfrmRelNiver = class(TForm)
    pnTop: TLMDBackPanel;
    fcLabel2: TfcLabel;
    pnCentro: TLMDBackPanel;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel4: TRxLabel;
    EdtInicial: TDateEdit;
    EdtFinal: TDateEdit;
    DCComboDestino: TDCComboBox;
    Edit1: TEdit;
    pnBotoes: TLMDBackPanel;
    btnSair: TJvTransparentButton;
    btnImprimir: TJvTransparentButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelNiver: TfrmRelNiver;

implementation

{$R *.dfm}

end.
