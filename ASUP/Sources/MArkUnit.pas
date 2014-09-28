{-$Id: MArkUnit.pas,v 1.2 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                       Модуль "Рейтинговые оценки работников"                 }
{    Основная экранная форма рейтинговых оценок                                }
{    Ответственный: Кропов Валентин                                            }

unit MArkUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, DB,
    IBCustomDataSet, IBQuery, DBCtrls;

type
    TMarkForm = class(TForm)
        ToolPanel: TPanel;
        AddButton: TSpeedButton;
        CancelButton: TSpeedButton;
        Bevel1: TBevel;
        Bevel2: TBevel;
        Label1: TLabel;
        PCardsGrid: TDBGrid;
        Splitter1: TSplitter;
        PCardViewQuery: TIBQuery;
        PcardsSource: TDataSource;
        MArkQuery: TIBQuery;
        MarkSource: TDataSource;
        PCardViewQueryID_PCARD: TIntegerField;
        PCardViewQueryTN: TIntegerField;
        PCardViewQueryID_MAN: TIntegerField;
        PCardViewQueryFIO: TIBStringField;
        MArkQueryID_TODOLIST: TIntegerField;
        MArkQueryID_ORDER: TIntegerField;
        MArkQueryDATE_ORDER: TDateField;
        MArkQueryNUM_ITEM: TIntegerField;
        MArkQueryDATE_BEG: TDateField;
        MArkQueryPLAN_DATE_END: TDateField;
        MArkQueryID_COMPLEX_MARK: TIntegerField;
        MArkQueryCOMPLEX_MARK_NAME: TIBStringField;
        MArkQueryCOMPLEX_MARK_VALUE: TFloatField;
        MArkQueryREAL_DATE_END: TDateField;
        MArkQueryID_QUALITY_MARK: TIntegerField;
        MArkQueryMARK_NAME: TIBStringField;
        MArkQueryMARK_VALUE: TFloatField;
        MArkQueryNOTE: TIBStringField;
        MArkQueryID_MAN_MOVING: TIntegerField;
        MArkQueryDEPARTMENT_NAME: TIBStringField;
        MArkQueryPOST_NAME: TIBStringField;
        MArkQueryID_SHTATRAS: TIntegerField;
        MArkQueryID_PCARD: TIntegerField;
        MArkQueryFIO: TIBStringField;
        Panel1: TPanel;
        MarkGrid: TDBGrid;
        Panel2: TPanel;
        Label2: TLabel;
        Name_Type: TDBText;
        Label3: TLabel;
        StatusText: TDBText;
        MArkQueryNUM_ORDER: TIBStringField;
        Label5: TLabel;
        DBText2: TDBText;
        Label6: TLabel;
        DBText3: TDBText;
        Label4: TLabel;
        DBText1: TDBText;
        Label7: TLabel;
        DBText4: TDBText;
        Label8: TLabel;
        DBText5: TDBText;
        Label9: TLabel;
        DBText6: TDBText;
        Label10: TLabel;
        DBText7: TDBText;
        OutputQuery: TIBQuery;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure FormResize(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
        procedure PCardsGridDblClick(Sender: TObject);
        procedure AddButtonClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    MarkForm: TMarkForm;

implementation
uses SpCommon, ToDoManCloseUnit, PersonalCommon;
{$R *.dfm}

procedure TMarkForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TMarkForm.FormResize(Sender: TObject);
begin
    GridResize(MArkGrid);
    GridResize(PCardsGrid);
end;

procedure TMarkForm.FormCreate(Sender: TObject);
begin
    PCardViewQuery.Transaction := PersonalCommon.ReadTransaction;
    MarkQuery.Transaction := PersonalCommon.ReadTransaction;
    OutputQuery.Transaction := PersonalCommon.WriteTransaction;
    PCardViewQuery.Close;
    PCardViewQuery.Open;
end;

procedure TMarkForm.CancelButtonClick(Sender: TObject);
begin
    Close();
end;

procedure TMarkForm.PCardsGridDblClick(Sender: TObject);
begin
    MarkQuery.Close;
    MarkQuery.Params.ParamValues['ID_PCARD'] := PCardViewQuery['ID_PCARD'];
    MarkQuery.Open;
end;

procedure TMarkForm.AddButtonClick(Sender: TObject);
var
    ToDoManCloseForm: TToDoManCloseForm;
begin
    if MarkQuery.IsEmpty
        then begin
        MessageDlg('Немає записів!', mtError, [mbOk], 0);
        exit;
    end;

    ToDoManCloseForm := TToDoManCloseForm.Create(Self);

    if (not MArkQueryID_QUALITY_MARK.IsNull)
        then begin
        ToDoManCloseForm.ID_MARK := MArkQueryID_QUALITY_MARK.Value;
        ToDoManCloseForm.CloseDate.DateTime := MArkQueryREAL_DATE_END.Value;
        ToDoManCloseForm.QualityMarkName.Caption := MArkQueryMARK_NAME.Value;
        ToDoManCloseForm.QualityMarkValue.Caption := MArkQueryMARK_VALUE.AsString;
    end
    else begin
        ToDoManCloseForm.ID_MARK := -1;
        ToDoManCloseForm.CloseDate.DateTime := Date;
        ToDoManCloseForm.QualityMarkName.Caption := 'Не вибрано';
        ToDoManCloseForm.QualityMarkValue.Caption := 'Не вибрано';
    end;

    if ToDoManCloseForm.ShowModal = mrOk
        then begin
        OutputQuery.Close;
        OutputQuery.SQL.Text := 'EXECUTE PROCEDURE DT_TODOLIST_CLOSE(' + IntToStr(MArkQueryID_TODOLIST.Value) + ',' + IntToStr(ToDoManCloseForm.ID_MARK) + ',''' + DateToStr(ToDoManCloseForm.CloseDate.Date) + ''');';
        ExecQuery(OutputQuery);
        MarkQuery.Close;
        MarkQuery.Open;
    end;
    ToDoManCloseForm.Free;
end;

end.
