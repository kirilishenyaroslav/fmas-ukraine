
{ -$Id: AddPostBonus.pas,v 1.5 2009/03/26 08:49:16 mzagurskaya Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                        Модуль "Добавление надбавок"                          }
{       Добавление и изменение данных о надбавках к должностям,                }
{       к позициям штатного  расписания, а также надбавок сотрудникам          }
{                                                  ответственный: Олег Волков  }

unit AddPostBonus;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    StdCtrls, SpComboBox, Buttons, Db, IBCustomDataSet, IBQuery, Mask,
    CheckEditUnit, ExtCtrls, ComCtrls, FieldControl, EditControl,
    PersonalCommon, SpCommon, DateUtils;

type
    TAddBonusMode = (abmPostBonus, abmShtatBonus, abmManBonus);

    TAddPostBonusForm = class(TForm)
        DetailsQuery: TIBQuery;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        Label1: TLabel;
        Label2: TLabel;
        Label3: TLabel;
        Label4: TLabel;
        DateEndPicker: TDateTimePicker;
        BonusGroup: TRadioGroup;
        PercentEdit: TCheckEdit;
        SumEdit: TCheckEdit;
        DetailsQueryID_POST: TIntegerField;
        DetailsQueryID_BONUS: TIntegerField;
        DetailsQueryDATE_BEG: TDateField;
        DetailsQueryDATE_END: TDateField;
        DetailsQueryIS_PERCENT: TIBStringField;
        DetailsQuerySUMMA: TIBBCDField;
        FC_Post: TFieldControl;
        FC_Bonus: TFieldControl;
        FC_DateBeg: TFieldControl;
        FC_DateEnd: TFieldControl;
        FC_Percent: TFieldControl;
        FC_Sum: TFieldControl;
        FC_IsPercent: TFieldControl;
        DateBegPicker: TDateTimePicker;
        PostBox: TSpComboBox;
        BonusBox: TSpComboBox;
        DetailsQueryPERCENT: TIBBCDField;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure OkButtonClick(Sender: TObject);
        procedure BonusGroupClick(Sender: TObject);
        procedure PostBoxEnter(Sender: TObject);
        procedure BonusBoxEnter(Sender: TObject);
        procedure FormShow(Sender: TObject);
    private
        FormControl: TEditControl;
        Mode: TEditMode;
        ExtMode: TAddBonusMode;
    public
        Id_Order, Num_Item: Integer;
        Id_Post_Bonus, Id_ShtatRas, Id_Man_Bonus, Id_Man_Moving: Integer;

        MinDateBeg, MaxDateBeg: TDate;
        NeedDateCheck: Boolean;


        constructor Create(AOwner: TComponent; Mode: TEditMode;
            ExtMode: TAddBonusMode); reintroduce;
    end;

var
    AddPostBonusForm: TAddPostBonusForm;

implementation

constructor TAddPostBonusForm.Create(AOwner: TComponent; Mode: TEditMode;
    ExtMode: TAddBonusMode);
var
    i, h: Integer;
begin
    inherited Create(AOwner);

    NeedDateCheck := False;

    Self.Mode := Mode;
    Self.ExtMode := ExtMode;

    DetailsQuery.Transaction := PersonalCommon.ReadTransaction;

    if (ExtMode = abmManBonus) or (ExtMode = abmShtatBonus) then
    begin
        h := BonusBox.Top - PostBox.Top;
        for i := 0 to ControlCount - 1 do
            Controls[i].Top := Controls[i].Top - h;
        Height := Height - h;
    end;
end;

{$R *.DFM}

procedure TAddPostBonusForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    PostBox.SaveIntoRegistry;
    BonusBox.SaveIntoRegistry;
    FormControl.Free;
end;

procedure TAddPostBonusForm.OkButtonClick(Sender: TObject);
begin
    FormControl.Read;
    if not FormControl.CheckFill then
    begin
        ModalResult := 0;
        Exit;
    end;
    if FC_DateBeg.Value > FC_DateEnd.Value then
    begin
        MessageDlg(
            'Дата початку періоду повинна бути менша за дату кінця',
            mtError, [mbOk], 0);
        ModalResult := 0;
        Exit;
    end;

    if (DateBegPicker.Date < MinDateBeg) and (NeedDateCheck) then
    begin
        MessageDlg('Дата початку періоду повинна бути більшою (або дорівнювати) за дату "' + DateToStr(MinDateBeg) + '"', mtError, [mbOk], 0);
        DateBegPicker.SetFocus;
        ModalResult := 0;
        Exit;
    end;

    if (DateEndPicker.Date > MaxDateBeg) and (NeedDateCheck) then
    begin
        MessageDlg('Дата початку періоду повинна бути меньшою (або дорівнювати) за дату "' + DateToStr(MaxDateBeg) + '"', mtError, [mbOk], 0);
        DateEndPicker.SetFocus;
        ModalResult := 0;
        Exit;
    end;

    if ExtMode = abmPostBonus then
        if Mode = emNew then
            FormControl.ExecProc('Dt_Post_Bonus_Insert', [])
        else
            FormControl.ExecProc('Dt_Post_Bonus_Update',
                [Id_Post_Bonus])
    else
        if ExtMode = abmShtatBonus then
            if Mode = emNew then
                FormControl.ExecProc('Dt_Shtat_Bonus_Insert_2', [Id_ShtatRas])
            else
                FormControl.ExecProc('DT_SHTAT_BONUS_UPDATE_2', [Id_ShtatRas, Id_Post_Bonus])
        else
            if ExtMode = abmManBonus then
                if Mode = emNew then
                    FormControl.ExecProc('Dt_Man_Bonus_Insert',
                        [Id_Man_Bonus, Id_Man_Moving, Id_Order, Num_Item])
                else
                    FormControl.ExecProc('Dt_Man_Bonus_Update',
                        [Id_Order, Num_Item, Id_Man_Bonus]);
end;

procedure TAddPostBonusForm.BonusGroupClick(Sender: TObject);
begin
    Flip([FC_Percent], [FC_Sum], BonusGroup.ItemIndex = 0, fmDisable);
end;

procedure TAddPostBonusForm.PostBoxEnter(Sender: TObject);
begin
    if ExtMode <> abmPostBonus then
    begin
        MessageDlg('Посада тут не змінюються',
            mtInformation, [mbOk], 0);
        DateBegPicker.SetFocus;
    end;
end;

procedure TAddPostBonusForm.BonusBoxEnter(Sender: TObject);
begin
    if ExtMode = abmShtatBonus then
    begin
        MessageDlg('Тип надбавки тут не змінюються',
            mtInformation, [mbOk], 0);
        DateBegPicker.SetFocus;
    end;
end;

procedure TAddPostBonusForm.FormShow(Sender: TObject);
begin
    with DetailsQuery.SQL do
        if ExtMode = abmPostBonus then // стандартная надбавка
        begin
            Clear;
            Add('SELECT Id_Post, Id_Bonus, Date_Beg, Date_End');
            Add(',Is_Percent, cast(Percent as Numeric(9,4)) AS Percent, Summa');
            Add('FROM Dt_Post_Bonus ');
            Add('WHERE Id_Post_Bonus = ' + IntToStr(Id_Post_Bonus));
        end
        else
            if ExtMode = abmShtatBonus then // надбавка к позиции ШР
            begin
                Clear;
                Add('SELECT 1 AS Id_Post, Id_Raise AS Id_Bonus, S.Date_Beg, S.Date_End');
                Add(',S.Is_Percent, S.Percent, S.Summa');
                Add('FROM Dt_Shtat_Bonus S');
                Add('WHERE S.Id_Post_Bonus = ' + IntToStr(Id_Post_Bonus));
                Add('AND Id_ShtatRas = ' + IntToStr(Id_ShtatRas));
                FC_Post.NeedUpdate := False;
    //	FC_Bonus.NeedUpdate := False;
            end
            else
            begin
                Clear;
                Add('SELECT -1 AS Id_Post, Id_Bonus, Date_Beg, Date_End');
                Add(',Is_Percent, Percent, Summa');
                Add('FROM Dt_Man_Bonus');
                Add('WHERE Id_Man_Bonus = ' + IntToStr(Id_Man_Bonus));
                Add('AND Id_Order = ' + IntToStr(Id_Order));
                Add('AND Num_Item = ' + IntToStr(Num_Item));
                FC_Post.NeedUpdate := False;
                Label1.Visible := False;
                PostBox.Visible := False;
            end;
    if Mode <> emNew then
    begin
        DetailsQuery.Open;
        if DetailsQuery.IsEmpty then
            MessageDlg('Не вдалося знайти запис. Можливо, його вилучив інший користувач!',
                mtError, [mbOk], 0);
    end;

    FormControl := TEditControl.Create;
    if (ExtMode <> abmManBonus) and (ExtMode <> abmShtatBonus)
        then FormControl.Add([FC_Post]);
    FormControl.Add([FC_Bonus, FC_DateBeg, FC_DateEnd, FC_IsPercent,
        FC_Percent, FC_Sum]);
    FormControl.Prepare(Mode);
    BonusGroupClick(Self);

    if ExtMode <> abmManBonus then
        case Mode of
            emNew: Caption := 'Додати надбавку до посади';
            emModify: Caption := 'Змінити надбавку до посади';
            emView: Caption := 'Надбавка до посади: перегляд';
        end
    else
        if Mode = emNew then
            Caption := 'Додати надбавку працівнику'
        else Caption := 'Змінити надбавку працівнику';

    if Mode = emNew then
    begin
        DateBegPicker.DateTime := EncodeDate(YearOf(Date), 1, 1);
        DateEndPicker.DateTime := EncodeDate(2150, 12, 31);
    end;
end;

end.
