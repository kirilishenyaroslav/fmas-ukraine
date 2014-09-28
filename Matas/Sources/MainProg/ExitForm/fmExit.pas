{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                              Главный модуль                                  }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit fmExit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, cxLookAndFeelPainters, cxButtons,
  uResources, Resources_unitb, ActnList;

type
  TExitForm = class(TForm)
    Image1: TImage;
    cxbEnter: TcxButton;
    cxbCancel: TcxButton;
    Label1: TLabel;
    KeyActionList: TActionList;
    ActionCancel: TAction;
    ActionOk: TAction;
    procedure FormCreate(Sender: TObject);
    procedure cxbEnterClick(Sender: TObject);
    procedure cxbCancelClick(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    IsOk: boolean;
  end;

var
  ExitForm: TExitForm;

implementation

{$R *.dfm}

procedure TExitForm.FormCreate(Sender: TObject);
begin
 IsOk:=false;
 Caption:=MAT_SYS_PREFIX+MAT_FORMCAP_EXIT;
 Label1.Caption:=MAT_STR_EXIT_QUEST;
 cxbEnter.Caption:=MAT_BUTTON_YES_CONST;
 cxbCancel.Caption:=MAT_BUTTON_NO_CONST;
end;

procedure TExitForm.cxbEnterClick(Sender: TObject);
begin
 Isok:=true;
 Close;
end;

procedure TExitForm.cxbCancelClick(Sender: TObject);
begin
 Close;
end;

procedure TExitForm.ActionCancelExecute(Sender: TObject);
begin
 Close;
end;

end.
