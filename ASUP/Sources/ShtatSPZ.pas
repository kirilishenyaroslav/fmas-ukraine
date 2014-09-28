
{ -$Id: ShtatSPZ.pas,v 1.2 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                 Модуль "Разбивка штатного расписания по ШПЗ"                 }
{           Отображение разбивки позиции штатного расписания по ШПЗ            }
{                                                  ответственный: Олег Волков  }

unit ShtatSPZ;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    Grids, Buttons, ExtCtrls, StdCtrls, Db, IBCustomDataSet, IBQuery,
    PersonalCommon, AddShtatSPZ, SpCommon;

type
    TShtatSPZForm = class(TForm)
        InfoPanel: TPanel;
        TopPanel: TPanel;
        AddButton: TSpeedButton;
        ModifyButton: TSpeedButton;
        DeleteButton: TSpeedButton;
        OkButton: TSpeedButton;
        CancelButton: TSpeedButton;
        SPZGrid: TStringGrid;
        InfoLabel: TLabel;
        Label1: TLabel;
        NeedLabel: TLabel;
        Label2: TLabel;
        ActualLabel: TLabel;
        ReadRowsQuery: TIBQuery;
        ReadRowsQueryID_SPZ: TIntegerField;
        ReadRowsQuerySPZ: TIBStringField;
        ReadRowsQueryNAME_SPZ: TIBStringField;
        ReadRowsQueryKOL_STAVOK: TIBBCDField;
        CloseQuery: TIBQuery;
        InsertQuery: TIBQuery;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure FormResize(Sender: TObject);
        procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
        procedure OkButtonClick(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
        procedure AddButtonClick(Sender: TObject);
        procedure DeleteButtonClick(Sender: TObject);
        procedure ModifyButtonClick(Sender: TObject);
    private
        Need_Stavok: Double;
        Actual_Stavok: Double;
        procedure ShowLabel;
        procedure LoadRows;
        procedure Write;
    public
        constructor Create(AOwner: TComponent; Id_ShtatRas: Integer;
            InfoString: string; Need_Stavok: Double); reintroduce;
    end;

var
    ShtatSPZForm: TShtatSPZForm;

implementation

{$R *.DFM}

constructor TShtatSPZForm.Create(AOwner: TComponent; Id_ShtatRas: Integer;
    InfoString: string; Need_Stavok: Double);
begin
    inherited Create(AOwner);
    Self.Need_Stavok := Need_Stavok;
    NeedLabel.Caption := FloatToStr(Need_Stavok);
    InfoLabel.Caption := InfoString;

    SPZGrid.Cells[1, 0] := 'ШПЗ';
    SPZGrid.Cells[2, 0] := 'Шифр виробничих затрат';
    SPZGrid.Cells[3, 0] := 'К-ть ставок';

    CloseQuery.Transaction := PersonalCommon.WriteTransaction;
    CloseQuery.Params.ParamValues['Id_ShtatRas'] := Id_ShtatRas;

    InsertQuery.Transaction := PersonalCommon.WriteTransaction;
    InsertQuery.Params.ParamValues['Id_ShtatRas'] := Id_ShtatRas;

    ReadRowsQuery.Transaction := PersonalCommon.ReadTransaction;
    ReadRowsQuery.Params.ParamValues['Id_ShtatRas'] := Id_ShtatRas;
    LoadRows;
    ShowLabel;
end;

procedure TShtatSPZForm.LoadRows;
var
    i: Integer;
begin
    ReadRowsQuery.Open;
    ReadRowsQuery.First;
    i := 1;
    while not ReadRowsQuery.Eof do
    begin
        if i > SPZGrid.RowCount - 1 then
            SPZGrid.RowCount := i + 1;
        with SPZGrid do
        begin
            Cells[0, i] := IntToStr(ReadRowsQuery['Id_SPZ']);
            Cells[1, i] := ReadRowsQuery['SPZ'];
            Cells[2, i] := ReadRowsQuery['Name_SPZ'];
            Cells[3, i] := FloatToStr(ReadRowsQuery['Kol_Stavok']);
            Actual_Stavok := Actual_Stavok +
                ReadRowsQuery['Kol_Stavok'];
        end;
        ReadRowsQuery.Next;
        inc(i);
    end;
    FormResize(Self);
end;

procedure TShtatSPZForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TShtatSPZForm.FormResize(Sender: TObject);
var
    i, s, w: Integer;
begin
    with SPZGrid do
    begin
        ColWidths[0] := 0;
        s := 0;
        for i := 1 to ColCount - 1 do
            s := s + ColWidths[i];

        w := ClientWidth - ColCount;

        for i := 1 to ColCount - 1 do
            ColWidths[i] := (ColWidths[i] * w) div s;
    end;
end;

procedure TShtatSPZForm.FormCloseQuery(Sender: TObject;
    var CanClose: Boolean);
begin
    if abs(Need_Stavok - Actual_Stavok) < 0.01 then
    begin
        CanClose := True;
        Write;
    end
    else
        if MessageDlg('Необхідна та наявна кількість ставок повинні співпадати.' +
            #13#10 + 'Вийти з відміною змін?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes
            then CanClose := False;
end;

procedure TShtatSPZForm.OkButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TShtatSPZForm.CancelButtonClick(Sender: TObject);
begin
    OnCloseQuery := nil;
    Close;
end;

procedure TShtatSPZForm.AddButtonClick(Sender: TObject);
var
    form: TAddShtatSPZForm;
    i: Integer;
begin
    form := TAddShtatSPZForm.Create(Self);
    if form.ShowModal = mrOk then
        with SPZGrid do
        begin
            if Cols[0].IndexOf(IntToStr(form.SPZBox.GetId)) <> -1 then
            begin
                MessageDlg('Це значення ШПЗ вже використано',
                    mtError, [mbOk], 0);
                Exit;
            end;
            if Cells[0, 1] = '' then i := 1
            else
            begin
                i := RowCount;
                RowCount := RowCount + 1;
            end;
            Cells[0, i] := IntToStr(form.SPZBox.GetId);
            Cells[1, i] := form.SPZBox.GetAdditionalField;
            Cells[2, i] := form.SPZBox.Text;
            Cells[3, i] := form.KolStavokEdit.Text;
            Actual_Stavok := Actual_Stavok + form.KolStavok;
            ShowLabel;
        end;
    form.Free;
end;

procedure TShtatSPZForm.DeleteButtonClick(Sender: TObject);
var
    i: Integer;
begin
    if (SPZGrid.Row = 1) and (SPZGrid.Cells[0, 1] = '') then Exit;
    if MessageDlg('Чи справді ви бажаєте вилучити цей запис?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        with SPZGrid do
        begin
            Actual_Stavok := Actual_Stavok - StrToFloat(Cells[3, Row]);
            ShowLabel;
            if RowCount > 2 then
            begin
                for i := Row to RowCount - 2 do
                    Rows[i] := Rows[i + 1];
                RowCount := RowCount - 1;
            end
            else
            begin
                Cells[0, 1] := ''; Cells[1, 1] := '';
                Cells[2, 1] := ''; Cells[3, 1] := '';
            end;
        end;
end;

procedure TShtatSPZForm.ModifyButtonClick(Sender: TObject);
var
    s: string;
    d: Double;
begin
    if (SPZGrid.Row = 1) and (SPZGrid.Cells[0, 1] = '') then Exit;
    with SPZGrid do
    begin
        s := Cells[3, Row];
        if InputQuery('Змінити для "' + Cells[2, Row] + '"',
            'кількість ставок', s) then
        begin
            try
                d := StrToFloat(s);
            except
                on EConvertError do
                begin
                    MessageDlg('Невірний формат', mtError,
                        [mbOk], 0);
                    ModifyButtonClick(Sender);
                    Exit;
                end;
            end;
            Actual_Stavok :=
                Actual_Stavok - StrToFloat(Cells[3, Row]) + d;
            ShowLabel;
            Cells[3, Row] := s;
        end;
    end;
end;

procedure TShtatSPZForm.Write;
var
    i, m: Integer;
begin
    try
        PersonalCommon.WriteTransaction.StartTransaction;
        ExecQuery(CloseQuery);
        with SPZGrid do
        begin
            if (RowCount = 1) and (Cells[0, 1] = '') then m := 0
            else m := RowCount - 1;
            for i := 1 to m do
            begin
                InsertQuery.Params.ParamValues['Id_SPZ'] :=
                    StrToInt(Cells[0, i]);
                InsertQuery.Params.ParamValues['Kol_Stavok'] :=
                    StrToFloat(Cells[3, i]);
                ExecQuery(InsertQuery);
            end;
        end;
    except on E: Exception do
        begin
            MessageDlg('При занесенні у базу даних виникла помилка: '
                + E.Message, mtError, [mbOk], 0);
            PersonalCommon.WriteTransaction.Rollback;
            Exit;
        end;
    end;
    PersonalCommon.WriteTransaction.Commit;
end;

procedure TShtatSPZForm.ShowLabel;
begin
    Actual_Stavok := Round(Actual_Stavok * 100) / 100;
    ActualLabel.Caption := FloatToStr(Actual_Stavok);
end;

end.
