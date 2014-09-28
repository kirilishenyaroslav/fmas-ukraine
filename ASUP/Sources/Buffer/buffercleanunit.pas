unit BufferCleanUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, DB, Grids, DBGrids, IBCustomDataSet, IBQuery, Halcn6db, StdCtrls, PersonalCommon,
    Buttons;

type
    TBuffersCleanForm = class(TForm)
        ResultQuery: TIBQuery;
        BuffNamesGrid: TDBGrid;
        ResultDataSource: TDataSource;
        ResultQueryBUFF_NAME: TIBStringField;
        ResultQueryIB_BUFF_NAME: TIBStringField;
        Label1: TLabel;
        DbfPathLabel: TLabel;
        ClearDataSet: THalcyonDataSet;
        CheckButton: TBitBtn;
        ClearButton: TBitBtn;
        ClearAllButton: TBitBtn;
        CloseButton: TBitBtn;
        procedure FormCreate(Sender: TObject);
        procedure CloseButtonClick(Sender: TObject);
        procedure ClearButtonClick(Sender: TObject);
        procedure CheckButtonClick(Sender: TObject);
        procedure ClearAllButtonClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    BuffersCleanForm: TBuffersCleanForm;

implementation

{$R *.dfm}

procedure TBuffersCleanForm.FormCreate(Sender: TObject);
begin
    ResultQuery.Close;
    ResultQuery.Open;

    DbfPathLabel.Caption := PersonalCommon.DBF_PATH;
    DbfPathLabel.Hint := PersonalCommon.DBF_PATH;
    ClearDataSet.DatabaseName := PersonalCommon.DBF_PATH;
end;

procedure TBuffersCleanForm.CloseButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TBuffersCleanForm.ClearButtonClick(Sender: TObject);
var
    index: string;
begin
    if ResultQuery.IsEmpty
        then begin
        MessageDlg('Немає буферів', mtError, [mbOk], 0);
        exit;
    end;

    if MessageDlg('Ви справді бажаєте очистити буфер "' + ResultQueryBUFF_NAME.Value + '"?', mtInformation, [mbYes, mbNo], 0) = ID_NO then exit;

    try
        ClearDataSet.TableName := ResultQueryBUFF_NAME.Value;
        ClearDataSet.Open;

        try
            ClearDataSet.IndexFiles.Clear;
            index := ResultQueryBUFF_NAME.Value + '.cdx';
            ClearDataSet.IndexFileInclude(index);
        except

        end;

        ClearDataSet.Zap;
        ClearDataSet.Close;
    except on E: Exception
        do begin
            MessageDlg('Під час очистки виникла помилка: "' + E.Message + '"! Очистку не було завершено!', mtError, [mbOk], 0);
            exit;
        end;
    end;

    MessageDlg('Буфер "' + ResultQueryBUFF_NAME.Value + '" було успішно очишено!', mtInformation, [mbOk], 0);

    if not Consts_Query.Active then
        Consts_Query.Open;

    if not DepNameQuery.Active then
        Consts_Query.Open;
end;

procedure TBuffersCleanForm.CheckButtonClick(Sender: TObject);
begin
    if ResultQuery.IsEmpty
        then begin
        MessageDlg('Немає буферів', mtError, [mbOk], 0);
        exit;
    end;

    try
        ClearDataSet.TableName := ResultQueryBUFF_NAME.Value;
        ClearDataSet.Open;
        MessageDlg('Кількість записів: ' + IntToStr(ClearDataSet.RecordCount), mtInformation, [mbOk], 0);
        ClearDataSet.Close;
    except on E: Exception
        do begin
            MessageDlg('Під час перевірки буферу виникла помилка: "' + E.Message + '"', mtError, [mbOk], 0);
            exit;
        end;
    end;

    if not Consts_Query.Active then
        Consts_Query.Open;

    if not DepNameQuery.Active then
        Consts_Query.Open;
end;

procedure TBuffersCleanForm.ClearAllButtonClick(Sender: TObject);
var
    index: string;
begin
    if ResultQuery.IsEmpty
        then begin
        MessageDlg('Немає буферів', mtError, [mbOk], 0);
        exit;
    end;

    if MessageDlg('Ви справді бажаєте очистити усі буфера?', mtInformation, [mbYes, mbNo], 0) = ID_NO then exit;

    try
        ResultQuery.First;
        while not ResultQuery.Eof
            do begin
            ClearDataSet.TableName := ResultQueryBUFF_NAME.Value;
            ClearDataSet.Open;

            try
                ClearDataSet.IndexFiles.Clear;
                index := ResultQueryBUFF_NAME.Value + '.cdx';
                ClearDataSet.IndexFileInclude(index);
            except

            end;

            ClearDataSet.Zap;
            ClearDataSet.Close;
            ResultQuery.Next;
        end
    except on E: Exception
        do begin
            MessageDlg('Під час очистки усіх буферів виникла помилка: "' + E.Message + '"! Очистку не було завершено!', mtError, [mbOk], 0);
            exit;
        end;
    end;

    MessageDlg('Усі буфера було успішно очишено!', mtInformation, [mbOk], 0);

    if not Consts_Query.Active then
        Consts_Query.Open;

    if not DepNameQuery.Active then
        DepNameQuery.Open;

    if not CurrSRQuery.Active then
        CurrSRQuery.Open;
end;

end.
