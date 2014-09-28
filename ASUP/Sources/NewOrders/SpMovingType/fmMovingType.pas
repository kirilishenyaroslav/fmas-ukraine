{-$Id: fmMovingType.pas,v 1.3 2006/01/11 07:53:25 valik Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                       Модуль "Справочник типов перемещения"                  }
{    Отображает справочник типов перемещения                                   }
{    Ответственный: Кропов Валентин                                            }

unit fmMovingType;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    StdCtrls, DBCtrls, Buttons, Grids, DBGrids, Db, IBCustomDataSet, IBQuery,
    ExtCtrls, SpCommon, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxGridCustomTableView,
    cxGridTableView, cxGridDBTableView, cxControls, cxGridCustomView, cxGrid,
    FIBDataSet, pFIBDataSet, ActnList, FIBDatabase, pFIBDatabase, cxClasses;

type
    TSpMovingTypeForm = class(TForm)
        Panel1: TPanel;
        AddButton: TSpeedButton;
        ModifyButton: TSpeedButton;
        DeleteButton: TSpeedButton;
        DataSource: TDataSource;
        OkButton: TSpeedButton;
        CancelButton: TSpeedButton;
        StyleRepository: TcxStyleRepository;
        stBackground: TcxStyle;
        stContent: TcxStyle;
        stContentEven: TcxStyle;
        stContentOdd: TcxStyle;
        stFilterBox: TcxStyle;
        stFooter: TcxStyle;
        stGroup: TcxStyle;
        stGroupByBox: TcxStyle;
        stHeader: TcxStyle;
        stInactive: TcxStyle;
        stIncSearch: TcxStyle;
        stIndicator: TcxStyle;
        stPreview: TcxStyle;
        stSelection: TcxStyle;
        stHotTrack: TcxStyle;
        qizzStyle: TcxGridTableViewStyleSheet;
        LocalDatabase: TpFIBDatabase;
        LocalReadTransaction: TpFIBTransaction;
        LocalWriteTransaction: TpFIBTransaction;
        KeyList: TActionList;
        OkAction: TAction;
        CancelAction: TAction;
        AddAction: TAction;
        ModifyAction: TAction;
        DeleteAction: TAction;
        WorkQuery: TpFIBDataSet;
        InputQuery: TpFIBDataSet;
        OrderGrid: TcxGrid;
        OrderGridDBTableView1: TcxGridDBTableView;
        OrderGridDBTableView1DBColumn1: TcxGridDBColumn;
        OrderGridLevel1: TcxGridLevel;
        InputQueryID_MOVING_TYPE: TFIBIntegerField;
        InputQueryNAME_MOVING_TYPE: TFIBStringField;
        InputQueryNAME_SHORT: TFIBStringField;
        OrderGridDBTableView1DBColumn3: TcxGridDBColumn;
        FindPanel: TPanel;
        SearchLabel: TLabel;
        Label1: TLabel;
        SearchEdit: TEdit;
        SearchNextButton: TSpeedButton;
        InputQueryREAD_ONLY: TFIBStringField;
    InputQueryIS_FIRST: TFIBIntegerField;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure OrderItemsGridDblClick(Sender: TObject);
        constructor Create(aOwner: TComponent; aID_TYPE: Integer); reintroduce;
        procedure SearchNextButtonClick(Sender: TObject);
        procedure SearchEditChange(Sender: TObject);
        procedure OrderGridDBTableView1KeyPress(Sender: TObject;
            var Key: Char);
        procedure OrderGridDBTableView1KeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
    procedure OkActionExecute(Sender: TObject);
    procedure CancelActionExecute(Sender: TObject);
    procedure AddActionExecute(Sender: TObject);
    procedure ModifyActionExecute(Sender: TObject);
    procedure DeleteActionExecute(Sender: TObject);
    procedure OrderGridDBTableView1DblClick(Sender: TObject);
    private
    { Private declarations }
    public
        ID_TYPE: Integer;
    end;

var
    SpMovingTypeForm: TSpMovingTypeForm;

implementation
uses fmAddMovingType;
{$R *.DFM}

procedure TSpMovingTypeForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild
        then Action := caFree;
end;

constructor TSpMovingTypeForm.Create(aOwner: TComponent; aID_TYPE: Integer);
begin
    inherited Create(aOwner);

    ID_Type := aId_Type;
end;

procedure TSpMovingTypeForm.OrderItemsGridDblClick(Sender: TObject);
begin
    OkButton.Click;
end;

procedure TSpMovingTypeForm.SearchNextButtonClick(Sender: TObject);
var
    TN: Integer;
begin
    try
        TN := StrToInt(SearchEdit.Text);
    except
        TN := 0;
    end;

    if TN <> 0 then
        InputQuery.LocateNext('Id_Moving_Type', SearchEdit.Text, [loPartialKey])
    else
        InputQuery.LocateNext('NAME_MOVING_TYPE', SearchEdit.Text, [loPartialKey,
            loCaseInsensitive]);
end;

procedure TSpMovingTypeForm.SearchEditChange(Sender: TObject);
var
    TN: Integer;
begin
    try
        TN := StrToInt(SearchEdit.Text);
    except
        TN := 0;
    end;

    if TN <> 0 then
        InputQuery.Locate('Id_Moving_Type', SearchEdit.Text, [loPartialKey])
    else
        InputQuery.Locate('NAME_MOVING_TYPE', SearchEdit.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TSpMovingTypeForm.OrderGridDBTableView1KeyPress(Sender: TObject;
    var Key: Char);
const
    LettersBig = 'АБВГҐДЕЁЖЗЄІИЇЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ';
    LettersSmall = 'абвгґдеёжзєіиїйклмнопрстуфхцчшщъыьэюя';
    Signs = '0123456789-()/\';
begin
    if (Pos(Key, LettersBig) = 0)
        and (Pos(Key, LettersSmall) = 0)
        and (Pos(Key, Signs) = 0)
        then Exit;

    SearchEdit.Text := SearchEdit.Text + Key;
end;

procedure TSpMovingTypeForm.OrderGridDBTableView1KeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if Key = VK_BACK then
        SendMessage(SearchEdit.Handle, WM_KEYDOWN, Key, 0);
end;

procedure TSpMovingTypeForm.OkActionExecute(Sender: TObject);
begin
    if InputQuery.IsEmpty
        then
        MessageDlg('Пустий довідник!', mtError, [mbOk], 0)
    else
        ModalResult := mrOk;
end;

procedure TSpMovingTypeForm.CancelActionExecute(Sender: TObject);
begin
    ModalResult := mrCancel;

    if FormStyle = fsMDIChild
        then Close;
end;

procedure TSpMovingTypeForm.AddActionExecute(Sender: TObject);
var
    temp: TAddMovingTypeForm;
    i: Integer;
begin
    temp := TAddMovingTypeForm.Create(Self);
    temp.Caption := 'Додавання нового типу переміщщеня';

    if ID_TYPE <> -1 then begin
        temp.Is_First.Checked := (ID_TYPE = 1);
        temp.Is_First.Enabled := False;
    end;

    temp.ShowModal;

    if temp.Is_First.Checked
        then i := 1
    else i := 0;

    if (temp.ModalResult = mrOk) then begin
        LocalWriteTransaction.StartTransaction;
        WorkQuery.QInsert.Close;
        WorkQuery.QInsert.SQL.Text := 'EXECUTE PROCEDURE INSERT_MOVING_TYPE(' + QuotedStr(temp.MovingTypeEdit.Text) + ',' + IntToStr(i) + ');';
        WorkQuery.QInsert.ExecQuery;
        LocalWriteTransaction.Commit;
    end;

    InputQuery.Close;
    InputQuery.Open;

    temp.Free;
end;

procedure TSpMovingTypeForm.ModifyActionExecute(Sender: TObject);
var
    temp: TAddMovingTypeForm;
    i: Integer;
begin

    if InputQueryREAD_ONLY.Value = 'T' then begin
        MessageDlg('Цей тип переміщення неможна змінювати!', mtError, [mbOk], 0);
        exit;
    end;

    temp := TAddMovingTypeForm.Create(Self);
    temp.Caption := 'Редагування типу переміщщеня';
    temp.MovingTypeEdit.Text := InputQuery['NAME_MOVING_TYPE'];

    if InputQuery['IS_FIRST'] = 1 then
        Temp.IS_FIRST.Checked := True
    else
        Temp.IS_FIRST.Checked := False;

    Temp.Is_First.Enabled := False;

    temp.ShowModal;

    if temp.Is_First.Checked
        then i := 1
    else i := 0;

    if (temp.ModalResult = mrOk) then begin
        LocalWriteTransaction.StartTransaction;
        WorkQuery.QUpdate.Close;
        WorkQuery.QUpdate.SQL.Text := 'EXECUTE PROCEDURE UPDATE_MOVING_TYPE(' + InputQueryID_MOVING_TYPE.AsString + ',' + QuotedStr(temp.MovingTypeEdit.Text) + ',' + IntToStr(i) + ');';
        WorkQuery.QUpdate.ExecQuery;
        LocalWriteTransaction.Commit;        
    end;

    InputQuery.Close;
    InputQuery.Open;

    temp.Free;
end;

procedure TSpMovingTypeForm.DeleteActionExecute(Sender: TObject);
begin
    if InputQueryREAD_ONLY.Value = 'T' then begin
        MessageDlg('Цей тип переміщення неможна вилучити!', mtError, [mbOk], 0);
        exit;
    end;

    if (not InputQuery.IsEmpty)
        then begin

        if MessageDlg('Ви справді бажаєте вилучити цей тип переміщення?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
            then begin
            LocalWriteTransaction.StartTransaction;
            WorkQuery.QDelete.Close;
            WorkQuery.QDelete.SQL.Text := 'EXECUTE PROCEDURE DELETE_MOVING_TYPE(' + InputQueryID_MOVING_TYPE.AsString + ');';
            WorkQuery.QDelete.ExecQuery;
            LocalWriteTransaction.Commit;

            InputQuery.Close;
            InputQuery.Open;
        end;
    end
    else
        MessageDlg('Немає пунктів для вилучення!', mtError, [mbOk], 0);
end;

procedure TSpMovingTypeForm.OrderGridDBTableView1DblClick(Sender: TObject);
begin
    if OkButton.Enabled then
        OkButton.Click;
end;

end.

