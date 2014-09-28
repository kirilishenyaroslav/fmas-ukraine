
{ -$Id: SpPostUnit.pas,v 1.3 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                      Модуль "Справочник должностей"                          }
{                    Работа со справочником должностей                         }
{                                                  ответственный: Олег Волков  }

unit SpPostUnit;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    SpFormUnit, Db, IBCustomDataSet, IBQuery, StdCtrls, ExtCtrls, ComCtrls,
    Buttons, ToolWin, Grids, DBGrids, EditControl, PersonalCommon, SpCommon,
    uSearchFrame;

type
    TSpPostForm = class(TSpForm)
        ResultQueryPOST_CODE: TIBStringField;
        ResultQueryNAME_CATEGORY: TIBStringField;
        ResultQueryNAME_POST: TIBStringField;
        ResultQueryHOLIDAY_LONG: TIntegerField;
        ResultQueryID_POST: TIntegerField;
        ResultQueryID_CATEGORY: TIntegerField;
        ResultQueryNAME_WORK_COND: TIBStringField;
        BufferQuery: TIBQuery;
        procedure AddButtonClick(Sender: TObject);
        procedure ModifyButtonClick(Sender: TObject);
        procedure ShowChangeForm(Mode: TEditMode);
        procedure DetailsButtonClick(Sender: TObject);
        procedure DeleteButtonClick(Sender: TObject);
    private
    { Private declarations }
    public
    end;

var
    SpPostForm: TSpPostForm;

implementation

uses AddPost, Buffer, uBuffer2;

procedure TSpPostForm.ShowChangeForm(Mode: TEditMode);
var
    form: TAddPostForm;
    id: Integer;
begin
    if Mode <> emNew then
        id := ResultQuery['Id_Post']
    else
        id := -1;
    form := TAddPostForm.Create(Self);
    form.Prepare(id, Mode);
    if form.ShowModal = mrOk then
    begin
        Refresh;
        if Mode = emNew then
            ResultQuery.Locate('Id_Post', form.Id_Post, []);
    end;
    form.Free;
end;

procedure TSpPostForm.AddButtonClick(Sender: TObject);
begin
    if not GPP_Check then Exit;
    ShowChangeForm(emNew);
end;

procedure TSpPostForm.ModifyButtonClick(Sender: TObject);
begin
    if not GPP_Check then Exit;

    if not ResultQuery.IsEmpty then
        ShowChangeForm(emModify);
end;

procedure TSpPostForm.DetailsButtonClick(Sender: TObject);
begin
    if not ResultQuery.IsEmpty then ShowChangeForm(emView);
end;

procedure TSpPostForm.DeleteButtonClick(Sender: TObject);
var
    ID_PBKey: Integer;
    BufTran2: TBufferTransaction2;
    First_PBKey, Last_PBKey: Integer;
begin
    if not GPP_Check then Exit;

    if ResultQuery.IsEmpty then Exit;
    if (MessageDlg('Чи ви справді бажаєте вилучити запис "' +
        ResultQuery['Name_Post'] + '"?', mtConfirmation,
        [mbYes, mbNo], 0) = mrNo) then Exit;

    BufTran2 := nil;
    if WriteTransaction.InTransaction then WriteTransaction.Rollback;
    WriteTransaction.StartTransaction;

    try
          // удаление из базы
        with WorkQuery do
        begin
            Transaction := WriteTransaction;
            Close;
            SQL.Text := 'EXECUTE PROCEDURE Sp_Post_Delete ' +
                IntToStr(ResultQuery['Id_Post']);
            ExecQuery(WorkQuery);
        end;

        if not DontWriteToDbf then
        begin
            BufferQuery.Transaction := WriteTransaction;
            BufferQuery.Close;
            BufferQuery.ParamByName('Id_Post').AsInteger := ResultQuery['Id_Post'];
            BufferQuery.Open;

            First_PBKey := BufferQuery['First_PBKey'];
            Last_PBKey := BufferQuery['Last_PBKey'];

            BufTran2 := TBufferTransaction2.
                Create('SP_POST', 'BUFF_SP_POST', WriteTransaction);
            BufTran2.WriteRange(First_PBKey, Last_PBKey);
        end;
        WriteTransaction.Commit;
    except on e: Exception do
        begin
            WriteTransaction.Rollback;
            if BufTran2 <> nil then BufTran2.RollbackOnError;

            MessageDlg('При занесенні інформації виникла помилка: ' +
                e.Message, mtError, [mbOk], 0);
            ModalResult := 0;
        end;
    end;

    if BufTran2 <> nil then BufTran2.Free;

    Refresh;
end;

initialization
    RegisterClass(TSpPostForm);
{$R *.DFM}

end.
