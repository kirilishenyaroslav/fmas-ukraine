{******************************************************************************}
{               Автоматизированная система управления персоналом               }
{                                                                              }
{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                      Пакет "Справочник должностей"                           }
{                 Модуль добавления/изменения категорий                        }
{                                               ответственный: Тимофеев Антон  }
unit U_SP_Post_AddCat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, CheckEditUnit, FieldControl, EditControl,
  U_SPPost_DataModule, SPCommon;

type
  TSP_post_AddCat = class(TForm)
    Label5: TLabel;
    CE_Name: TCheckEdit;
    SbCancel: TBitBtn;
    SbOk: TBitBtn;
    CB_O: TCheckBox;
    CB_v: TCheckBox;
    IS_NPP: TCheckBox;
    IS_P: TCheckBox;
    FC_Name: TFieldControl;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SbCancelClick(Sender: TObject);
    procedure SbOkClick(Sender: TObject);
  private
    FormControl: TEditControl;
  public
    Add:Boolean;
    id:string;
    DMod:TDMSPPost;
  end;

var
  SP_post_AddCat: TSP_post_AddCat;

implementation

{$R *.dfm}

procedure TSP_post_AddCat.FormCreate(Sender: TObject);
begin
  DMod := TDMSPPost.Create(Self);
  FormControl := TEditControl.Create;
  FormControl.Add([FC_Name]);
  FormControl.Prepare(emNew);
end;

procedure TSP_post_AddCat.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FormControl.Free;
end;

procedure TSP_post_AddCat.SbCancelClick(Sender: TObject);
begin
	ModalResult := mrCancel;
	Close;
end;

procedure TSP_post_AddCat.SbOkClick(Sender: TObject);
var s, o, v, npp, np:string;
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

  o:='F'; if CB_o.Checked then o:='T';
  v:='F'; if CB_v.Checked then v:='T';
  npp:='F'; if is_npp.Checked then npp:='T';
  np:='F'; if is_p.Checked then np:='T';
  with DMod do
  begin
    if Add
     then FIBQuery.SQL.Text:='execute procedure sp_category_univer_insert('+QuotedStr(CE_Name.Text)+','+
                             QuotedStr(v)+','+QuotedStr(o)+','+QuotedStr(npp)+','+QuotedStr(np)+');'

     else FIBQuery.SQL.Text:='execute procedure sp_category_univer_update('+QuotedStr(CE_Name.Text)+','+
                             QuotedStr(v)+','+QuotedStr(o)+','+QuotedStr(npp)+','+QuotedStr(np)+','+Id+');';
    try
      FIBWriteTransaction.StartTransaction;
      FIBQuery.ExecProc;
      FIBWriteTransaction.Commit;
    except on e: Exception do
    begin
      if Add then s:='додати'
            else s:='змінити';
      MessageDlg('Не вдалося '+s+' запис: '+#13+e.Message,mtError,[mbYes],0);
      FIBWriteTransaction.RollBack;
          error:=True;
    end;
  end;
  end;
end;

end.
