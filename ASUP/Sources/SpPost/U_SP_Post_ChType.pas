{******************************************************************************}
{               Автоматизированная система управления персоналом               }
{                                                                              }
{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                      Пакет "Справочник должностей"                           }
{                 Модуль изменеия типов                                        }
{                                               ответственный: Тимофеев Антон  }
unit U_SP_Post_ChType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, CheckEditUnit, FieldControl, EditControl,
  U_SPPost_DataModule, SPCommon;

type
  TSP_Post_ChType = class(TForm)
    Label5: TLabel;
    FC_Name: TFieldControl;
    CE_Name: TCheckEdit;
    SbOk: TBitBtn;
    SbCancel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SbCancelClick(Sender: TObject);
    procedure SbOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FormControl: TEditControl;
  public
    DMod:TDMSPPost;
    Salary,Add:Boolean;
    id,field,table:string;
  end;

var
  SP_Post_ChType: TSP_Post_ChType;

implementation

{$R *.dfm}

procedure TSP_Post_ChType.FormCreate(Sender: TObject);
begin
  DMod := TDMSPPost.Create(Self);
  FormControl := TEditControl.Create;
  FormControl.Add([FC_Name]);
  FormControl.Prepare(emNew);
end;

procedure TSP_Post_ChType.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FormControl.Free;
end;

procedure TSP_Post_ChType.SbCancelClick(Sender: TObject);
begin
	ModalResult := mrCancel;
	Close;
end;

procedure TSP_Post_ChType.SbOkClick(Sender: TObject);
begin
  FormControl.Read;

  if not FormControl.CheckFill then
  begin
    ModalResult := 0;
    Exit;
  end;

  if not TextOk(CE_Name.Text)
   then begin
     MessageDlg('Не вірно введена назва',mtError,[mbYes],0);
     Exit;
   end;

  with DMod do
  begin
     if not Add then
      FIBQuery.SQL.Text:='execute procedure '+table+'update('+id+','+QuotedStr(CE_Name.Text)+');' else
      FIBQuery.SQL.Text:='execute procedure '+table+'insert('+QuotedStr(CE_Name.Text)+');';
    try
      FIBWriteTransaction.StartTransaction;
      FIBQuery.ExecProc;
      FIBWriteTransaction.Commit;
    except on e: Exception do
    begin
      MessageDlg('Не вдалося змінити запис: '+#13+e.Message,mtError,[mbYes],0);
      FIBWriteTransaction.RollBack;
          error:=True;
    end;
  end;
  end;
end;

procedure TSP_Post_ChType.FormShow(Sender: TObject);
begin
  if Salary then
   if Add then
    Self.Caption:='Додати нову властивість' else
    Self.Caption:='Змінити назву властивості';
end;

end.
