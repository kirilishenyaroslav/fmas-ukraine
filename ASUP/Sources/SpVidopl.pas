
{ -$Id: SpVidopl.pas,v 1.2 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                      Модуль "Справочник видов оплат"                         }
{                     Работа со справочником видов оплат                       }
{                                                  ответственный: Олег Волков  }

unit SpVidopl;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, SpFormUnit, DB, IBCustomDataSet, IBQuery, Grids, DBGrids,
    Buttons, StdCtrls, ExtCtrls, AddVidopl, SpComboBox, uSearchFrame;

type
    TSpVidoplForm = class(TSpForm)
        BuffQuery: TIBQuery;
        FilterPanel: TPanel;
        TarNetLabel: TLabel;
        FilterBox: TSpComboBox;
        RemoveFilter: TBitBtn;
        procedure DeleteButtonClick(Sender: TObject);
        procedure AddButtonClick(Sender: TObject);
        procedure ModifyButtonClick(Sender: TObject);
        procedure FilterBoxEnter(Sender: TObject);
        procedure FilterBoxChange(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure RemoveFilterClick(Sender: TObject);
    private
    public
        Use_Filter: Boolean;
        procedure Init(Params: TSpParams); override;
    end;

var
    SpVidoplForm: TSpVidoplForm;

implementation

uses Buffer, SpCommon, PersonalCommon;

{$R *.dfm}

procedure TSpVidoplForm.DeleteButtonClick(Sender: TObject);
var
    ID_PBKey: Integer;
begin
    if not GPP_Check then Exit;

    if ResultQuery.IsEmpty then Exit;
    if (MessageDlg('Чи ви справді бажаєте вилучити запис "' +
        ResultQuery['Name_Vidopl'] + '"?', mtConfirmation,
        [mbYes, mbNo], 0) = mrNo) then Exit;

    BufTran.Start;
    try
          // удаление из базы
        with WorkQuery do
        begin
            Close;
            SQL.Text := 'EXECUTE PROCEDURE Sp_VidOpl_Delete ' +
                IntToStr(ResultQuery['Id_VidOpl']);
            ExecQuery(WorkQuery);
        end;
          // добавление записи для отката и получение ключа буфера
        ID_PBKey := bufTran.AddRecord('Payment', 'Buff_Payment');

                 // заполнение дублирующего буфера Interbase
        BuffQuery.Transaction := BufferTransaction;
        with BuffQuery.Params do
        begin
            ParamValues['Id_VidOpl'] := ResultQuery['Id_VidOpl'];
            ParamValues['Name_VidOpl'] := ResultQuery['Name_VidOpl'];
            ParamValues['Id_PBKey'] := Id_PBKey;
        end;
        ExecQuery(BuffQuery);

                 // запись в буфер
        WriteToDbf('Payment', 'Buff_Payment', Id_PBKey);
    except on e: Exception do
        begin
            ShowError(e);
            bufTran.Rollback;
            Exit;
        end;
    end;
    bufTran.Commit;
    Refresh;
end;

procedure TSpVidoplForm.AddButtonClick(Sender: TObject);
begin
    if not GPP_Check then Exit;
    inherited;
end;

procedure TSpVidoplForm.ModifyButtonClick(Sender: TObject);
begin
    if not GPP_Check then Exit;
    inherited;
end;

procedure TSpVidoplForm.FilterBoxEnter(Sender: TObject);
begin
    inherited;
    if spfCantRemoveFilter in Params.SpMode then SpGrid.SetFocus;
end;

procedure TSpVidoplForm.FilterBoxChange(Sender: TObject);
begin
    if (ResultQuery <> nil) and (ResultQuery.Transaction <> nil)
        and (FilterBox.ItemIndex > 0) then
    begin
        ResultQuery.SQL.Text := 'SELECT * FROM Sp_Vidopl_Select(:Id_Vidopl_Prop)';
        ResultQuery.Params.ParamValues['Id_Vidopl_Prop'] := FilterBox.GetId;
        Refresh;
    end;
end;

procedure TSpVidoplForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    inherited;
    FilterBox.SaveIntoRegistry;
end;

procedure TSpVidoplForm.RemoveFilterClick(Sender: TObject);
begin
    inherited;
    if (ResultQuery <> nil) and (ResultQuery.Transaction <> nil)
        and (FilterBox.ItemIndex > 0) then
    begin
        FilterBox.ItemIndex := -1;
        ResultQuery.Params.ParamValues['Id_Vidopl_Prop'] := -1;
        Refresh;
    end;
end;

procedure TSpVidoplForm.Init(Params: TSpParams);
begin
    inherited Init(Params);
    if Use_Filter then
        FilterBox.ItemIndex := -1
    else FilterPanel.Visible := False;
end;

initialization
    RegisterClass(TSpVidoplForm);

end.
