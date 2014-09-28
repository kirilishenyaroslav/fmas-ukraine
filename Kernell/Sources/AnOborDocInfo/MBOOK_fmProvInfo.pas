unit MBOOK_fmProvInfo;

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
  TfmProvInfo = class(TForm)
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
    dxBarButton1: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    SaveDialog1: TSaveDialog;
    fr3Report: TfrxReport;
    dgrDocumentsViewDBColumn1: TcxGridDBColumn;
    dgrDocumentsViewDBColumn2: TcxGridDBColumn;
    procedure btnRefreshClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure chkbxGroupClick(Sender: TObject);
    procedure chkbxFilterClick(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
  private
    Owner: TComponent;                   (* хозяин формы *)
    hConnection: TISC_DB_HANDLE;         (* handle базы данных *)
    D_ID_SCH,                            (* идентификатор дебитового счета *)
    K_ID_SCH,                            (* идентификатор кредитового счета *)
    ID_SMETA,                            (* идентификатор сметы *)
    ID_RAZDEL,                           (* идентификатор раздела *)
    ID_STAT,                             (* идентификатор статьи *)
    ID_KEKV:         Int64;              (* идентификатор КЭКВ *)
    D_OR_K_OBOROT,                       (* флаг: 0 - отбираем оборот по дебету
                                                  1 - по кредиту *)
    Id_Lang:         Integer;            (* флаг: 0 - русский язык
                                                  1 - украинский *)
    Date_Beg,                            (* начальная дата периода запроса *)
    Date_End:        TDate;              (* конечная дата периода запроса *)

    ErrorMessageFIB: String;             (* Строка с сообщением об ошибке *)
    ErrorMessageInvalidSch: String;      (* Сообщение о том, что не указаны все счета *)

    SchState: Boolean;                   (* True, если указан хотя бы один счет *)
  public
    constructor Create(AOwner: TComponent;
                       AhConnection: TISC_DB_HANDLE;
                       AD_ID_SCH, AK_ID_SCH, AID_SMETA, AID_RAZDEL, AID_STAT, AID_KEKV: Int64;
                       AD_OR_K_OBOROT: Integer;
                       ADate_Beg, ADate_End: TDateTime;
                       AId_Lang: Integer); reintroduce;
    destructor Destroy; override;
    procedure Refresh;
    procedure SetLanguage(LenguageId: Integer);
  end;


implementation

{$R *.dfm}
constructor TfmProvInfo.Create(AOwner: TComponent;
                               AhConnection: TISC_DB_HANDLE;
                               AD_ID_SCH, AK_ID_SCH, AID_SMETA, AID_RAZDEL, AID_STAT, AID_KEKV: Int64;
                               AD_OR_K_OBOROT: Integer;
                               ADate_Beg, ADate_End: TDateTime;
                               AId_Lang: Integer);
begin
  (* Создаем форму и сохраняем параметры *)

  inherited Create(AOwner);

  SetLanguage(AId_Lang);

  Owner         := AOwner;
  hConnection   := AhConnection; 
  (* Подготавливаем параметры на вход хранимой процедуры.
     Определяем присланы ли необязательные параметры. *)
  D_ID_SCH      := AD_ID_SCH;
  K_ID_SCH      := AK_ID_SCH;

  ID_SMETA  := AID_SMETA;
  ID_RAZDEL := AID_RAZDEL;
  ID_STAT   := AID_STAT;
  ID_KEKV   := AID_KEKV;

  Date_Beg      := ADate_Beg;
  Date_End      := ADate_End;
  D_OR_K_OBOROT := AD_OR_K_OBOROT;
  Id_Lang       := AId_Lang;

  (* Применяем полученное соединение с базой *)
  pi_DataBase.Handle := hConnection;
  pi_DataBase.DefaultTransaction.Active;

  SchState := true;
  (* При исключении откатываем транзакцию и выдаем сообщение.
       Программа продолжает работать. *)
  if (D_ID_SCH = -1) and (K_ID_SCH = -1) then
  begin
    SchState := false;
    MessageDlg(ErrorMessageInvalidSch, mtError, [mbOk], 0);
  end
  else
  begin
    (* NOP *);
  end;
  Refresh;
end;
(* Завершаем читающую транзакцию *)
destructor TfmProvInfo.Destroy;
begin
     inherited Destroy;
end;
(* Перезагружает данные в grid
   Операция Refresh *)
procedure TfmProvInfo.btnRefreshClick(Sender: TObject);
begin
  Refresh;
end;
(* Показывает отчет, который после можно распечатать
   Операция Print *)
procedure TfmProvInfo.btnPrintClick(Sender: TObject);
begin
    fr3Report.LoadFromFile(ExtractFilePath(Application.ExeName) + '\Reports\Mbook\OborDocReestr.fr3',true);
    fr3Report.Variables['KR_DATA']  := '''' + '2 ' + '''';
    fr3Report.Variables['DB_DATA']  := '''' + '3 ' + '''';

    fr3Report.PrepareReport(true);
    fr3Report.ShowPreparedReport;
end;
(* Изменяет настройку grid'a dgrDocumentsView.OptionsView.GroupByBox
   Включает или выключает данную настройку *)
procedure TfmProvInfo.chkbxGroupClick(Sender: TObject);
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
procedure TfmProvInfo.chkbxFilterClick(Sender: TObject);
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
procedure TfmProvInfo.Refresh;
begin
  if SchState then
  begin
    try
      with pi_DataSet do
      begin
        (* Если TpFIBDataSet уже открыт, закрываем его, чтобы перечитать. *)
        if Active then
          Close;
        (* Выполняем в DataSet хранимую процедуру и выбираем из нее все записи *)
        (* Дата должна быть в ковычках *)
        SelectSQL.Text := ' select * ' +
                          '   from MBOOK_SP_GET_OBOR_PROV_INFO(' + IntToStr(D_ID_SCH) + ',' +
                                                                   IntToStr(K_ID_SCH) + ',' +
                                                                   QuotedStr(DateToStr(Date_Beg)) + ',' +
                                                                   QuotedStr(DateToStr(Date_End)) + ',' +
                                                                   IntToStr(D_OR_K_OBOROT) + ',' +
                                                                   IntToStr(ID_SMETA)  + ',' +
                                                                   IntToStr(ID_RAZDEL) + ',' +
                                                                   IntToStr(ID_STAT)   + ',' +
                                                                   IntToStr(ID_KEKV)   + ')';
      end;
      (* Перечитываем информацию из базы *)
      pi_DataSet.Open;
    except on E: Exception do
    begin
      (* При исключении откатываем транзакцию и выдаем сообщение.
         Программа продолжает работать. *)
      MessageDlg(ErrorMessageFIB, mtError, [mbOk], 0);
    end;
    end;
  end
  else
  begin
    (* NOP *);
  end;
end;
(* Изменяет язык надписей на форме *)
procedure TfmProvInfo.SetLanguage(LenguageId: Integer);
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
procedure TfmProvInfo.dxBarLargeButton1Click(Sender: TObject);
begin
      if SaveDialog1.Execute
      then begin
                ExportGrid4ToExcel(SaveDialog1.FileName, dgrDocuments, false, true, false);
      end;
end;

end.
