unit ACardsDocsInfoEx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxContainer, cxCheckBox,
  ExtCtrls, ibase, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, frxClass, frxDBSet, cxTextEdit,
  cxMemo, cxDBEdit, StdCtrls, cxExport, cxGridDBDataDefinitions, cxExportGrid4Link ;

type
  TfrmACDocsInfoEx = class(TForm)
    dgrDocuments: TcxGrid;
    dgrDocumentsLevelFirst: TcxGridLevel;
    dgrDocumentsView: TcxGridDBTableView;
    brmngButtons: TdxBarManager;
    btnRefresh: TdxBarLargeButton;
    btnPrint: TdxBarLargeButton;
    pnlChkBx: TPanel;
    chkbxFilter: TcxCheckBox;
    pi_DataBase: TpFIBDatabase;
    pi_DataSet: TpFIBDataSet;
    pi_ReadTransaction: TpFIBTransaction;
    pi_DataSource: TDataSource;
    fr3DataSet: TfrxDBDataset;
    clmnDocNumber: TcxGridDBColumn;
    clmnTypeDoc: TcxGridDBColumn;
    clmnDate: TcxGridDBColumn;
    clmnUser: TcxGridDBColumn;
    clmnDocNote: TcxGridDBColumn;
    clmnSumma: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    columnst: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    chkbxGroup: TcxCheckBox;
    Panel1: TPanel;
    cxDBMemo1: TcxDBMemo;
    Label1: TLabel;
    fr3Report: TfrxReport;
    dxBarButton1: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    SaveDialog1: TSaveDialog;
    procedure btnRefreshClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure chkbxGroupClick(Sender: TObject);
    procedure chkbxFilterClick(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
  private
    Owner: TComponent;                   (* хозяин формы *)
    hConnection: TISC_DB_HANDLE;         (* handle базы данных *)
    ID_RAZDEL,                           (* идентификатор раздела *)
    ID_KEKV:         Int64;              (* идентификатор КЭКВ *)
    Id_Lang:         Integer;            (* флаг: 0 - русский язык
                                                  1 - украинский *)
    Date_Beg,                            (* начальная дата периода запроса *)
    Date_End:        TDate;              (* конечная дата периода запроса *)

    ErrorMessageFIB: String;             (* Строка с сообщением об ошибке *)
    ErrorMessageInvalidSch: String;      (* Сообщение о том, что не указаны все счета *)
    FId_type_rec:Integer;

  public
    constructor Create(AOwner: TComponent;
                       AhConnection: TISC_DB_HANDLE;
                       id_param_set, AID_RAZDEL, AID_KEKV: Int64;
                       ADate_Beg, ADate_End, ADateProv: Variant;
                       AId_Lang: Integer;ProcName:String; Id_type_rec:Integer;
                       profitable :Integer; isKekv:Boolean); reintroduce;
    destructor Destroy; override;
    procedure Refresh;
    procedure SetLanguage(LenguageId: Integer);
  end;


implementation

{$R *.dfm}
constructor TfrmACDocsInfoEx.Create(AOwner: TComponent;
                                  AhConnection: TISC_DB_HANDLE;
                                  id_param_set, AID_RAZDEL, AID_KEKV: Int64;
                                  ADate_Beg, ADate_End, ADateProv: Variant;
                                  AId_Lang: Integer;ProcName:String;
                                  Id_type_rec:Integer; profitable: Integer; isKekv:Boolean);
begin
  (* Создаем форму и сохраняем параметры *)

  inherited Create(AOwner);

  SetLanguage(AId_Lang);

  Owner         := AOwner;
  hConnection   := AhConnection;

  ID_RAZDEL := AID_RAZDEL;
  ID_KEKV   := AID_KEKV;

  Date_Beg      := ADate_Beg;
  Date_End      := ADate_End;
  Id_Lang       := AId_Lang;
  FId_type_rec  :=Id_type_rec;

  (* Применяем полученное соединение с базой *)
  pi_DataBase.Handle := hConnection;
  pi_DataBase.DefaultTransaction.Active;

  if FId_type_rec in [11,12,13,14,31,32,33,34]
  then begin

            if not isKekv
            then begin
                      pi_DataSet.SelectSQL.Text:='select * from '+ProcName+'('
                      +IntToStr(id_param_set)+','
                      +''''+VarToStr(ADate_Beg)+''''+','
                      +''''+VarToStr(ADate_End)+''''+','
                      +'null'+','
                      +IntToStr(AID_RAZDEL)+
                      ',0,'+
                      IntToStr(FId_type_rec)+','+
                      IntToStr(profitable)+')';
            end
            else begin
                      pi_DataSet.SelectSQL.Text:='select * from '+ProcName+'('
                      +IntToStr(id_param_set)+','
                      +''''+VarToStr(ADate_Beg)+''''+','
                      +''''+VarToStr(ADate_End)+''''+','
                      +'null'+','
                      +IntToStr(AID_KEKV)+
                      ',1,'+
                      IntToStr(FId_type_rec)+','+
                      IntTostr(profitable)+')';
            end;
  end;                                                                                   ;

  if FId_type_rec in [21,22,23,24]
  then begin

            if not isKekv
            then begin
                      pi_DataSet.SelectSQL.Text:='select * from '+ProcName+'('
                      +IntToStr(id_param_set)+','
                      +''''+VarToStr(ADate_Beg)+''''+','
                      +''''+VarToStr(ADate_End)+''''+','
                      +''''+VarToStr(ADateProv)+''''+','
                      +IntToStr(AID_RAZDEL)+
                      ',0,'+
                      IntToStr(FId_type_rec)+','+
                      IntToStr(profitable)+')';
            end
            else begin
                      pi_DataSet.SelectSQL.Text:='select * from '+ProcName+'('
                      +IntToStr(id_param_set)+','
                      +''''+VarToStr(ADate_Beg)+''''+','
                      +''''+VarToStr(ADate_End)+''''+','
                      +''''+VarToStr(ADateProv)+''''+','
                      +IntToStr(AID_KEKV)+
                      ',1,'+
                      IntToStr(FId_type_rec)+','+
                      IntTostr(profitable)+')';
            end;
  end;                                                                                   ;



  Refresh;
end;
(* Завершаем читающую транзакцию *)
destructor TfrmACDocsInfoEx.Destroy;
begin
     inherited Destroy;
end;
(* Перезагружает данные в grid
   Операция Refresh *)
procedure TfrmACDocsInfoEx.btnRefreshClick(Sender: TObject);
begin
  Refresh;
end;
(* Показывает отчет, который после можно распечатать
   Операция Print *)
procedure TfrmACDocsInfoEx.btnPrintClick(Sender: TObject);
begin
    {fr3Report.LoadFromFile(ExtractFilePath(Application.ExeName) + '\Reports\Mbook\OborDocReestr.fr3',true);
    fr3Report.Variables['KR_DATA']  := '''' + '2 ' + '''';
    fr3Report.Variables['DB_DATA']  := '''' + '3 ' + '''';

    fr3Report.PrepareReport(true);
    fr3Report.ShowPreparedReport;}
end;
(* Изменяет настройку grid'a dgrDocumentsView.OptionsView.GroupByBox
   Включает или выключает данную настройку *)
procedure TfrmACDocsInfoEx.chkbxGroupClick(Sender: TObject);
var i: Integer;  (* Счетчик по группированным элементам *)
begin
  with dgrDocumentsView do
  begin
     OptionsView.GroupByBox := chkbxGroup.Checked;
     if not OptionsView.GroupByBox then
        (* 'Разгруппирование' *)
        for i := GroupedColumnCount - 1 downto 0 do
        begin
             with GroupedColumns[i] do
             begin
                 Visible := true;
                 GroupIndex := -1;
             end;
        end;
  end;
end;
(* Изменяет настройку grid'a dgrDocumentsView.OptionsCustomize.ColumnFiltering
   Включает или выключает данные настройки *)
procedure TfrmACDocsInfoEx.chkbxFilterClick(Sender: TObject);
begin
  with dgrDocumentsView do
  begin
      OptionsCustomize.ColumnFiltering := chkbxFilter.Checked;
      if not OptionsCustomize.ColumnFiltering then
      begin
          (* Убираем фильтры *)
          Filtering.Visible := fvNever;
          DataController.Filter.Active := false;
      end
      else
          (* Отображаем фильтр, если есть строки *)
          Filtering.Visible := fvNonEmpty;
  end;
end;
(* Перезагружает данные в grid
   Операция Refresh *)
procedure TfrmACDocsInfoEx.Refresh;
begin
     if pi_DataSet.Active then pi_DataSet.Close;
     pi_DataSet.Open;

end;
(* Изменяет язык надписей на форме *)
procedure TfrmACDocsInfoEx.SetLanguage(LenguageId: Integer);
begin
    case LenguageId of
    0:
    begin
        (* Надписи на форме *)
        //Caption := 'Дополнительная информация по проводке';
        btnRefresh.Caption := 'Обновить';
        btnPrint.Caption := 'Печать';
        chkbxGroup.Properties.Caption := 'Использовать автоматическую группировку';
        chkbxFilter.Properties.Caption := 'Использовать автоматический фильтр';
        (* Названия столбцив в cxGrid *)
        clmnDocNumber.Caption := 'Номер документа';
        clmnTypeDoc.Caption := 'Тип документа';
        clmnDate.Caption := 'Дата проведения';
        clmnUser.Caption := 'Идентификатор пользователя';
        clmnDocNote.Caption := 'Комментарий';
        clmnSumma.Caption := 'Сумма проводки';
        (* Символьные константы *)
        ErrorMessageFIB := 'Невозможно считать информацию из базы. Обратитесь к администратору.';
        ErrorMessageInvalidSch := 'Не указан ни дебетовый ни кредитовый счет. Обратитесь к администратору.';
    end;
    1:
    begin
        (* Надписи на форме *)
        //Caption := 'Додаткова інформація за проведенням';
        btnRefresh.Caption := 'Оновити';
        btnPrint.Caption := 'Друк';
        chkbxGroup.Properties.Caption := 'Використовувати автоматичне группування';
        chkbxFilter.Properties.Caption := 'Використовувати автоматичний фільтр';
        (* Названия столбцив в cxGrid *)
        clmnDocNumber.Caption := 'Номер документу';
        clmnTypeDoc.Caption := 'Тип документу';
        clmnDate.Caption := 'Дата проведення';
        clmnUser.Caption := 'Ідентифікатор користувача';
        clmnDocNote.Caption := 'Комментар';
        clmnSumma.Caption := 'Сума проводки';
        (* Символьные константы *)
        ErrorMessageFIB := 'Неможливо зчитати інформацію з бази данних. Зверніться до адміністратора.';
        ErrorMessageInvalidSch := 'Не вказан ні дебетовий ні кредитовий рахунок. Зверніться до адміністратора.';
    end;
    end;
end;
procedure TfrmACDocsInfoEx.dxBarLargeButton1Click(Sender: TObject);
begin
      if SaveDialog1.Execute
      then begin
                ExportGrid4ToExcel(SaveDialog1.FileName, dgrDocuments, false, true, false);
      end;
end;


end.
