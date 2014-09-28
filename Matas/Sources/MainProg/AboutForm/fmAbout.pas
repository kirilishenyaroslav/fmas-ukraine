{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                              Главный модуль                                  }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit fmAbout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, cxLookAndFeelPainters, cxButtons,
  uResources, uMatasVars, uMatasUtils, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMemo, cxRadioGroup, ActnList;

type
  TAboutForm = class(TForm)
    Image1: TImage;
    LabelMatas: TLabel;
    LabelVersionCap: TLabel;
    cxButton1: TcxButton;
    LabelOrg: TLabel;
    LabelVersion: TLabel;
    cxMemoNews: TcxMemo;
    cxShowNews: TcxRadioGroup;
    KeyActionList: TActionList;
    ActionCancel: TAction;
    ActionOk: TAction;
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxRadioGroup1PropertiesChange(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutForm: TAboutForm;

implementation

uses MainForm, dmMain;

{$R *.dfm}
procedure TAboutForm.FormCreate(Sender: TObject);
begin
 Caption:= MAT_SYSTEM_SHORT_NAME;
 LabelMatas.Caption:=MAT_SYSTEM_FULL_NAME;
 LabelVersionCap.Caption:=MAT_STR_VERSION+':';
 LabelVersion.Caption:=GetVersionStrInfo;
 cxButton1.Caption:=MAT_ACTION_CLOSE_CONST;
 LabelOrg.Caption:=_ORG_FULL_NAME;
 cxMemoNews.Lines.LoadFromFile(ExtractFilepath(Application.ExeName)+_WHATS_NEW_MAT_FILENAME);
end;

procedure TAboutForm.cxButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TAboutForm.cxRadioGroup1PropertiesChange(Sender: TObject);
begin
 if cxShowNews.ItemIndex=0 then
  cxMemoNews.Lines.LoadFromFile(ExtractFilepath(Application.ExeName)+_WHATS_NEW_MAT_FILENAME)
 else
  cxMemoNews.Lines.LoadFromFile(ExtractFilepath(Application.ExeName)+_WHATS_NEW_INV_FILENAME);
end;

procedure TAboutForm.ActionCancelExecute(Sender: TObject);
begin
 Close;
end;

end.
