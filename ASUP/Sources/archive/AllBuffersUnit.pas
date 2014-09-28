unit AllBuffersUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst, Buttons, PersonalCommon, SpCommon, ProcessUnit,
  Buffer, DB, IBCustomDataSet, IBQuery, Mask, CheckEditUnit, ExtCtrls;

type
  TAllBuffersForm = class(TForm)
    GroupBox1: TGroupBox;
    VO: TCheckBox;
    Departments: TCheckBox;
    People: TCheckBox;
    Post: TCheckBox;
    WorkMode: TCheckBox;
    Vihod: TCheckBox;
    Calendar: TCheckBox;
    Table: TCheckBox;
    Hospital: TCheckBox;
    SPZ: TCheckBox;
    WorkReg: TCheckBox;
    Moving: TCheckBox;
    MovingSynhronize: TCheckBox;
    HolidaySynhronize: TCheckBox;
    BonusSynhronize: TCheckBox;
    OrdersSynhronize: TCheckBox;
    WorkModeChange: TCheckBox;
    Panel1: TPanel;
    AllChecked: TButton;
    UnAllChecked: TButton;
    TablePanel: TPanel;
    TableFast: TCheckBox;
    LastTable: TCheckBox;
    MonthEdit: TCheckEdit;
    Label1: TLabel;
    Label2: TLabel;
    YearEdit: TCheckEdit;
    InfoQuery: TIBQuery;
    BuffQuery: TIBQuery;
    Panel3: TPanel;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    SyncPanel: TPanel;
    procedure VO_DUMP;
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Departments_dump;
    procedure people_dump;
    procedure post_dump;
    procedure workmode_dump;
    procedure vihod_dump;
    procedure calendar_dump;
    procedure table_dump;
    procedure new_table_dump;
    procedure hospital_dump;
    procedure spz_dump;
    procedure workreg_dump;
    procedure moving_dump;
    procedure AllCheckedClick(Sender: TObject);
    procedure UnAllCheckedClick(Sender: TObject);
    procedure MovingsSynhronizeProc;
    procedure HolidaySynhronizeProc;
    procedure BonusSynhronizeProc;
    procedure OrdersSynhronizeProc;
    procedure WorkModeChangeSync;
    procedure TableFastClick(Sender: TObject);
  private
    { Private declarations }
  public
    ID_REESTR:Integer;
  end;

var
  AllBuffersForm: TAllBuffersForm;

implementation

uses PCardExportUnit;

{$R *.dfm}

procedure TAllBuffersForm.VO_DUMP;
var
	ID_PBKey: Integer;
    form: TProcessForm;
begin
    form := TProcessForm.Create(Self);
    form.Caption := 'Вигрузка видів оплати, зачекайте...';
    form.Show;

	BuffQuery.SQL.Text := 'EXECUTE PROCEDURE BUFF_ADD_PAYMENT ' +
		':Id_VidOpl,  :Name_Vidopl, :Id_Action, :Id_PBKey, :Cash, :Tip_Nach';
	InfoQuery.SQL.Text := 'SELECT * FROM Sp_Vidopl';
	bufTran.Start;
	try
		InfoQuery.Open;
        InfoQuery.FetchAll;
        form.Progress.Max := InfoQuery.RecordCount;
		InfoQuery.First;

		while not InfoQuery.Eof do
		begin
			Id_PBKey := BufTran.AddRecord('Payment', 'Buff_Payment');
				// запись в буфер Interbase
			BuffQuery.Close;
			with BuffQuery.Params do
			begin
				ParamValues['Id_VidOpl'] :=InfoQuery['Id_Vidopl'];
				ParamValues['Id_Action'] := 1;
				ParamValues['Name_VidOpl'] := InfoQuery['Name_Vidopl'];
				ParamValues['Id_PBKey'] := Id_PBKey;
				ParamValues['Cash'] := InfoQuery['Cash'];
 				ParamValues['Tip_Nach'] := InfoQuery['Tip_Nach'];
			end;
			ExecQuery(BuffQuery);

			// запись в dbf
			WriteToDbf('Payment', 'Buff_Payment', Id_PBKey);
            if Stop then break;
            form.Step;
			InfoQuery.Next;
		end;

	except on e:Exception do
		begin
            form.Close;
			ShowError(e);
			BufTran.Rollback;
			ModalResult := 0;
			Exit;
		end
	end;
    form.Close;
	BufTran.Commit;
	//ShowMessage('Експорт завершений!');
    VO.Font.Color := clMaroon;
end;

procedure TAllBuffersForm.Departments_dump;
begin
    MassExport('Sp_PodrK', 'Buff_Sp_PodrK', 'SELECT * FROM ASUP_LTD_ALL_DEPARTMENTS_EXPORT');
    Departments.Font.Color := clMaroon;
end;


procedure TAllBuffersForm.people_dump;
var
	form : TPCardExportForm;
begin
    form := TPCardExportForm.Create(self);
    form.Show;
    Form.OkButton.Click;
    people.Font.Color := clMaroon;
end;

procedure TAllBuffersForm.post_dump;
var
	ID_PBKey: Integer;
    form: TProcessForm;
begin
    form := TProcessForm.Create(Self);
    form.Caption := 'Вигрузка посад, зачекайте...';
    form.Show;

    if Version = 1 then
    	BuffQuery.SQL.Text := 'EXECUTE PROCEDURE BUFF_ADD_POST :Post_Name,' +
	    	':Id_Post, :Id_Action, :Id_PBKey';
    if Version = 2 then
        BuffQuery.SQL.Text := 'EXECUTE PROCEDURE BUFF_ADD_NPOST :Post_Name,' +
	    	':Id_Post, :Category, :Action, :Id_PBKey';

	InfoQuery.SQL.Text := 'SELECT * FROM Sp_Post';
	bufTran.Start;
	try
		InfoQuery.Open;
        InfoQuery.FetchAll;
        form.Progress.Max := InfoQuery.RecordCount;
		InfoQuery.First;

		while not InfoQuery.Eof do
		begin
			Id_PBKey := BufTran.AddRecord('Sp_Post', 'Buff_Sp_Post');
				// запись в буфер Interbase
			BuffQuery.Close;
            if Version = 1 then
			with BuffQuery.Params do
			begin
				ParamValues['Id_Post'] := InfoQuery['Id_Post'];
				ParamValues['Post_Name'] := InfoQuery['Name_Post'];
				ParamValues['Id_Action'] := 1;
				ParamValues['Id_PBKey'] := Id_PBKey;
			end;
            if Version = 2 then
			with BuffQuery.Params do
			begin
				ParamValues['Id_Post'] := InfoQuery['Id_Post'];
				ParamValues['Post_Name'] := InfoQuery['Name_Post'];
                ParamValues['Category'] := InfoQuery['Id_Category'];
				ParamValues['Action'] := 1;
				ParamValues['Id_PBKey'] := Id_PBKey;
			end;

			ExecQuery(BuffQuery);

			// запись в dbf
            if Version = 1 then WriteToDbf('Sp_Post', 'Buff_Sp_Post', Id_PBKey);
            if Version = 2 then WriteToDbf('NPost', 'Buff_NPost', Id_PBKey);
            if Stop then break;
            form.Step;
			InfoQuery.Next;
		end;

	except on e:Exception do
		begin
            form.Close;
			ShowError(e);
			BufTran.Rollback;
			ModalResult := 0;
			Exit;
		end
	end;
	BufTran.Commit;
    form.Close;
    Post.Font.Color := clMaroon;
end;

procedure TAllBuffersForm.workmode_dump;
var
	ID_PBKey: Integer;
    form: TProcessForm;
begin
    form := TProcessForm.Create(Self);
    form.Caption := 'Вигрузка режимів праці, зачекайте...';
    form.Show;

	BuffQuery.SQL.Text := 'EXECUTE PROCEDURE Buff_Add_Sp_Time :Id_Time, :Name,'+
        ':Date_Beg, :Date_End, :Id_Action, :Id_PBKey';
	InfoQuery.SQL.Text := 'SELECT * FROM Dt_Work_Mode';
	bufTran.Start;
	try
		InfoQuery.Open;
        InfoQuery.FetchAll;
        form.Progress.Max := InfoQuery.RecordCount;
		InfoQuery.First;

		while not InfoQuery.Eof do
		begin
			Id_PBKey := BufTran.AddRecord('Sp_Time', 'Buff_Sp_Time');
				// запись в буфер Interbase
			BuffQuery.Close;
			with BuffQuery.Params do
			begin
				ParamValues['Id_Time'] :=InfoQuery['Id_Work_Mode'];
				ParamValues['Id_Action'] := 1;
				ParamValues['Name'] := Copy(InfoQuery['Name'], 1, 100);
				ParamValues['Id_PBKey'] := Id_PBKey;
			end;
			ExecQuery(BuffQuery);

			// запись в dbf
			WriteToDbf('Sp_Time', 'Buff_Sp_Time', Id_PBKey);
            if Stop then break;
            form.Step;
			InfoQuery.Next;
		end;

	except on e:Exception do
		begin
            form.Close;
			ShowError(e);
			BufTran.Rollback;
			ModalResult := 0;
			Exit;
		end
	end;
    form.Close;
	BufTran.Commit;
    WorkMode.Font.Color := clMaroon;
end;

procedure TAllBuffersForm.vihod_dump;
var
	ID_PBKey: Integer;
    form: TProcessForm;
begin
    form := TProcessForm.Create(Self);
    form.Caption := 'Вигрузка типів виходів, зачекайте...';
    form.Show;

    BuffQuery.SQL.Text := 'EXECUTE PROCEDURE BUFF_ADD_DAY_TYPE :Id_DTypeK,' +
        ':DType_Name, 1, :Id_PBKey';
	InfoQuery.SQL.Text := 'SELECT * FROM Sp_Vihod';
	bufTran.Start;
	try
		InfoQuery.Open;
        InfoQuery.FetchAll;
        form.Progress.Max := InfoQuery.RecordCount;
		InfoQuery.First;

		while not InfoQuery.Eof do
		begin
			Id_PBKey := BufTran.AddRecord('Day_Type', 'Buff_Day_Type');
				// запись в буфер Interbase
			BuffQuery.Close;
			with BuffQuery.Params do
			begin
				ParamValues['Id_PBKey'] := Id_PBKey;
                ParamValues['Id_DTypeK'] := InfoQuery['Id_Vihod'];
                ParamValues['DType_Name'] := InfoQuery['Name_Full'];
			end;

			ExecQuery(BuffQuery);

			// запись в dbf
            WriteToDbf('Day_Type', 'Buff_Day_Type', Id_PBKey);
            if Stop then break;
            form.Step;
			InfoQuery.Next;
		end;

	except on e:Exception do
		begin
            form.Close;
			ShowError(e);
			BufTran.Rollback;
			ModalResult := 0;
			Exit;
		end
	end;
	BufTran.Commit;
    form.Close;
    Vihod.Font.Color := clMaroon;
end;

procedure TAllBuffersForm.calendar_dump;
var
	ID_PBKey, y, m: Integer;
    form: TProcessForm;
    dayString: String;
begin
    form := TProcessForm.Create(Self);
    form.Caption := 'Вигрузка календарю, зачекайте...';
    form.Show;

    BuffQuery.SQL.Text := 'EXECUTE PROCEDURE BUFF_ADD_CALENDER :Tbl_Year,' +
        ':Tbl_Month, 1, :Day_Types, :Id_PBKey';

	InfoQuery.SQL.Text := 'SELECT * FROM Calendar ORDER BY Tbl_Year, Tbl_Month, Tbl_Day';
	bufTran.Start;
	try
		InfoQuery.Open;
        InfoQuery.FetchAll;
        form.Progress.Max := InfoQuery.RecordCount;
		InfoQuery.First;

		while not InfoQuery.Eof do
		begin
            y := InfoQuery['Tbl_Year'];
            m := InfoQuery['Tbl_Month'];
            dayString := '';
            while (InfoQuery['Tbl_Year'] = y) and (InfoQuery['Tbl_Month'] = m)
                and not InfoQuery.Eof do
            begin
                if InfoQuery['Holiday'] = 'T' then dayString := dayString + 'P'
                else dayString := dayString + 'W';

                InfoQuery.Next;
                if Stop then break;
                form.Step;
            end;

			Id_PBKey := BufTran.AddRecord('Calender', 'Buff_Calender');
				// запись в буфер Interbase
			BuffQuery.Close;
			with BuffQuery.Params do
			begin
				ParamValues['Id_PBKey'] := Id_PBKey;
                ParamValues['Tbl_Year'] := y;
                ParamValues['Tbl_Month'] := m;
                ParamValues['Day_Types'] := dayString;
			end;

			ExecQuery(BuffQuery);

			// запись в dbf
            WriteToDbf('Calender', 'Buff_Calender', Id_PBKey);
		end;

	except on e:Exception do
		begin
            form.Close;
			ShowError(e);
			BufTran.Rollback;
			ModalResult := 0;
			Exit;
		end
	end;
	BufTran.Commit;
    form.Close;
    Calendar.Font.Color := clMaroon;
end;

procedure TAllBuffersForm.table_dump;
var
	ID_PBKey: Integer;
    form: TProcessForm;
begin
    if version = 1 then exit;

    form := TProcessForm.Create(Self);
    form.Caption := 'Вигрузка табелів, зачекайте...';
    form.Show;

     BuffQuery.SQL.Text := 'EXECUTE PROCEDURE BUFF_ADD_NTABLE :Id_PBKey, 1, '
            + ':Id_Man_Moving, :Year, :Month, :Day, :Time_Beg, :Time_End, '
            + ':Break_Beg, :Break_End, :Hours, :NHours, :PHours, :GHours,'
            + ':SHours, :VHours, :Id_Vihod';

	InfoQuery.SQL.Text := 'SELECT * FROM Dt_Table';
	bufTran.Start;
	try
		InfoQuery.Open;
        InfoQuery.FetchAll;
        form.Progress.Max := InfoQuery.RecordCount;
		InfoQuery.First;

		while not InfoQuery.Eof do
		begin
			Id_PBKey := BufTran.AddRecord('NTable', 'Buff_NTable');
				// запись в буфер Interbase
			BuffQuery.Close;
			with BuffQuery.Params do
			begin
				ParamValues['Id_PBKey'] := Id_PBKey;
				ParamValues['Id_Man_Moving'] := InfoQuery['Id_Man_Moving'];
              	ParamValues['Year'] := InfoQuery['Tbl_Year'];
                ParamValues['Month'] := InfoQuery['Tbl_Month'];
                ParamValues['Day'] := InfoQuery['Tbl_Day'];
                ParamValues['Time_Beg'] := InfoQuery['Work_Beg'];
                ParamValues['Time_End'] := InfoQuery['Work_End'];
                ParamValues['Break_Beg'] := InfoQuery['Break_Beg'];
                ParamValues['Break_End'] := InfoQuery['Break_End'];
                ParamValues['Hours'] := InfoQuery['Hours'];
                ParamValues['NHours'] := InfoQuery['NHours'];
                ParamValues['PHours'] := InfoQuery['PHours'];
                ParamValues['GHours'] := InfoQuery['GHours'];
                ParamValues['SHours'] := InfoQuery['SHours'];
                ParamValues['VHours'] := InfoQuery['VHours'];
                ParamValues['Id_Vihod'] := InfoQuery['Id_Vihod'];
			end;

			ExecQuery(BuffQuery);

			// запись в dbf
            WriteToDbf('NTable', 'Buff_NTable', Id_PBKey);
            if Stop then break;
            form.Step;
			InfoQuery.Next;
		end;

	except on e:Exception do
		begin
            form.Close;
			ShowError(e);
			BufTran.Rollback;
			ModalResult := 0;
			Exit;
		end
	end;
	BufTran.Commit;
    form.Close;
    Table.Font.Color := clMaroon;
end;

procedure TAllBuffersForm.new_table_dump;
var
	First_PBKey, Last_PBKey, i, Last_Only: Integer;
    sql: String;
begin
    if version = 1 then exit;

    if LastTable.Checked then Last_Only := 1
    else Last_Only := 0;

	InfoQuery.SQL.Text := 'SELECT * FROM Mass_Table_Export(' + MonthEdit.Text +
        ',' + YearEdit.Text + ',' + IntToStr(Last_Only) + ')';
	try
        WriteTransaction.StartTransaction;
		InfoQuery.Open;
        First_PBKey := InfoQuery['First_PBKey'];
        Last_PBKey := InfoQuery['Last_PBKey'];

        BufferTable.Close;
        BufferTable.TableName := 'ntable';
        BufferTable.Open;
        BufferTable.IndexFiles.Clear;
        BufferTable.IndexFileInclude('ntable.cdx');

		// запись в dbf
        sql := 'SELECT * FROM Buff_NTable WHERE Id_PBKey BETWEEN ' +
            IntToStr(First_PBKey) + ' AND ' + IntToStr(Last_PBKey);
        MassWriteToDbf('NTable', 'Buff_NTable', sql);
        Log_Action('TABLE_DUMP',YearEdit.Text + '-' + MonthEdit.Text);

	except on e:Exception do
		begin
			ShowError(e);
			ModalResult := 0;
            BufferTable.Close;
            WriteTransaction.Rollback;
			Exit;
		end
	end;
    Table.Font.Color := clMaroon;
    BufferTable.Close;
    WriteTransaction.Commit;
end;


procedure TAllBuffersForm.hospital_dump;
var
	ID_PBKey: Integer;
    form: TProcessForm;
begin
    if version = 1 then exit;

    form := TProcessForm.Create(Self);
    form.Caption := 'Вигрузка листів непрацездатності, зачекайте...';
    form.Show;

    BuffQuery.SQL.Text := 'INSERT INTO BUFF_NHOSP(Id_PbKey,Time_In,Date_In,'+
    'ACTION_LTD, Id_Man,Id_Hosp,Id_Parent,T_Num,Ink,Date_Beg,'+
    'Date_End,List_Ser,List_Num,Illness,VO_K,PERCENT,KOD,Id_Time,Shift,D_Beg_Hosp,Id_Reestr,Id_Last)'+
    'VALUES(:Id_PbKey,'+'''NOW'''+','+'''NOW'''+',:Act,:Id_Man,:Id_Hosp,:Id_Parent, :T_Num,:Ink,:Date_Beg,'+
    ':Date_End,:List_Ser,:List_Num,:Illness,:VOPL,:PERCENT,:KOD, :Id_Time, :Shift, :D_Beg_Hosp,:Id_reestr,:ID_Last)';

	InfoQuery.SQL.Text :='SELECT * FROM SEL_HOSP_FOR_BUFFER ('+IntToStr(ID_REESTR)+')';
	bufTran.Start;
	try
		InfoQuery.Open;
        InfoQuery.FetchAll;
        form.Progress.Max := InfoQuery.RecordCount;
		InfoQuery.First;

		while not InfoQuery.Eof do
		begin
			Id_PBKey := BufTran.AddRecord('NHosp', 'Buff_NHosp');
				// запись в буфер Interbase
			BuffQuery.Close;
			with BuffQuery.Params do
			begin
				ParamValues['Id_PBKey'] := Id_PBKey;
                ParamValues['Act'] := 1;
                ParamValues['ID_MAN'] := InfoQuery['ID_MAN'];
                ParamValues['ID_HOSP'] := InfoQuery['ID_MAN_HOSP'];
                ParamValues['T_NUM'] := InfoQuery['TN'];
                ParamValues['INK'] := InfoQuery['TIN'];
                ParamValues['DATE_BEG'] := InfoQuery['DATE_BEG'];
                ParamValues['DATE_END'] := InfoQuery['DATE_END'];
                ParamValues['LIST_SER'] := InfoQuery['SERIA'];
                ParamValues['LIST_NUM'] := InfoQuery['NOMER'];
                ParamValues['ILLNESS'] := InfoQuery['ILNESS_NOTES'];
                ParamValues['VOPL'] := InfoQuery['VOPL'];
                ParamValues['ID_PARENT'] := InfoQuery['ID_PARENT'];
                ParamValues['PERCENT'] := InfoQuery['PERCENT'];
                ParamValues['KOD'] := InfoQuery['KOD'];
                ParamValues['Id_Time'] := InfoQuery['Id_Work_Mode'];
                ParamValues['Shift'] := InfoQuery['Shift'];
                ParamValues['ID_REESTR']:=ID_REESTR;
                ParamValues['ID_Last']:=InfoQuery['Id_Last'];
			end;

			ExecQuery(BuffQuery);

			// запись в dbf
            WriteToDbf('NHOSP', 'Buff_NHOSP', Id_PBKey);
            if Stop then break;
            form.Step;
			InfoQuery.Next;
		end;
//Запись периодов нарушения режима

    BuffQuery.SQL.Text := 'INSERT INTO BUFF_NHOSPDET(Id_PbKey,Time_In,Date_In,'+
    'Id_Hosp,Date_Beg,'+
    'Date_End,List_Ser,List_Num) VALUES('+
    ' :Id_PBKey,'+'''NOW'''+','+'''NOW'''+',:ID_HOSP,:DATE_BEG,:DATE_END,:LIST_SER,:LIST_NUM)';

	InfoQuery.SQL.Text := 'SELECT E.Id_Man_Hosp,E.Date_beg,E.Date_End,'+
  'H.Seria,H.Nomer FROM EXCEPT_HOSP_PERIOD E,Man_Hospital H,Hosp_Reestr_Data HRD '+
   'WHERE E.Id_Man_Hosp=H.Id_Man_Hosp and HRD.ID_HOSP=H.ID_MAN_HOSP AND HRD.ID_REESTR='+IntTosTR(ID_REESTR);
		InfoQuery.Open;
        InfoQuery.FetchAll;
        form.Progress.Max := InfoQuery.RecordCount;
		InfoQuery.First;

		while not InfoQuery.Eof do
		begin
			Id_PBKey := BufTran.AddRecord('NHospDet', 'Buff_NHospDet');
				// запись в буфер Interbase
			BuffQuery.Close;
			with BuffQuery.Params do
			begin
				ParamValues['Id_PBKey'] := Id_PBKey;
                ParamValues['ID_HOSP'] := InfoQuery['ID_MAN_HOSP'];
                ParamValues['DATE_BEG'] := InfoQuery['DATE_BEG'];
                ParamValues['DATE_END'] := InfoQuery['DATE_END'];
                ParamValues['LIST_SER'] := InfoQuery['SERIA'];
                ParamValues['LIST_NUM'] := InfoQuery['NOMER'];
			end;

			ExecQuery(BuffQuery);

			// запись в dbf
            WriteToDbf('NHOSPDet', 'Buff_NHOSPDet', Id_PBKey);
            if Stop then break;
            form.Step;
			InfoQuery.Next;
		end;



	except on e:Exception do
		begin
            form.Close;
			ShowError(e);
			BufTran.Rollback;
			ModalResult := 0;
			Exit;
		end
	end;
	BufTran.Commit;
    form.Close;
    Hospital.Font.Color := clMaroon;
end;

procedure TAllBuffersForm.spz_dump;
var
  	ID_PBKey: Integer;
    form: TProcessForm;
begin
    if version = 1 then exit;

    form := TProcessForm.Create(Self);
    form.Caption := 'Вигрузка ШПЗ, зачекайте...';
    form.Show;

	BuffQuery.SQL.Text := 'INSERT INTO BUFF_NSPZ(ID_PBKEY,ID_ACTION,ID_SPZ,NAME_SPZ,KOD_SPZ) ' +
		'VALUES(:Id_PBKEY,  :ID_ACTION, :Id_SPZ, :NAME_SPZ, :KOD_SPZ)';
	InfoQuery.SQL.Text := 'SELECT * FROM INI_SPZ';
	bufTran.Start;
	try
		InfoQuery.Open;
        InfoQuery.FetchAll;
        form.Progress.Max := InfoQuery.RecordCount;
		InfoQuery.First;

		while not InfoQuery.Eof do
		begin
			Id_PBKey := BufTran.AddRecord('NSpz', 'Buff_NSPZ');
				// запись в буфер Interbase
			BuffQuery.Close;
			with BuffQuery.Params do
			begin
				ParamValues['ID_SPZ'] :=InfoQuery['Id_SPZ'];
				ParamValues['Id_Action'] := 1;
				ParamValues['Name_SPZ'] := InfoQuery['Name_SPZ'];
				ParamValues['Id_PBKey'] := Id_PBKey;
				ParamValues['KOD_SPZ'] := InfoQuery['SPZ'];
 			end;
			ExecQuery(BuffQuery);

			// запись в dbf
			WriteToDbf('NSPZ', 'Buff_NSPZ', Id_PBKey);
            if Stop then break;
            form.Step;
			InfoQuery.Next;
		end;

	except on e:Exception do
		begin
            form.Close;
			ShowError(e);
			BufTran.Rollback;
			ModalResult := 0;
			Exit;
		end
	end;
    form.Close;
	BufTran.Commit;
    Spz.Font.Color := clMaroon;
end;


procedure TAllBuffersForm.workreg_dump;
var
	ID_PBKey: Integer;
    form: TProcessForm;
begin
    if version = 1 then exit;

    form := TProcessForm.Create(Self);
    form.Caption := 'Вигрузка розшифровок режимів праці, зачекайте...';
    form.Show;

     BuffQuery.SQL.Text := 'EXECUTE PROCEDURE BUFF_ADD_NTIME :Id_PBKey, 1, '
            + ':Id_Time, :Day, :Time_Beg, :Time_End, :Break_Beg, :Break_End ';

	InfoQuery.SQL.Text := 'SELECT * FROM Dt_WorkReg';
	bufTran.Start;
	try
		InfoQuery.Open;
        InfoQuery.FetchAll;
        form.Progress.Max := InfoQuery.RecordCount;
		InfoQuery.First;

		while not InfoQuery.Eof do
		begin
			Id_PBKey := BufTran.AddRecord('NTime', 'Buff_NTime');
				// запись в буфер Interbase
			BuffQuery.Close;
			with BuffQuery.Params do
			begin
				ParamValues['Id_PBKey'] := Id_PBKey;
                ParamValues['Id_Time'] := InfoQuery['Id_Work_Mode'];
                ParamValues['Day'] := InfoQuery['Id_Day_Week'];
                ParamValues['Time_Beg'] := InfoQuery['Work_Beg'];
                ParamValues['Time_End'] := InfoQuery['Work_End'];
                ParamValues['Break_Beg'] := InfoQuery['Break_Beg'];
                ParamValues['Break_End'] := InfoQuery['Break_End'];
			end;

			ExecQuery(BuffQuery);

			// запись в dbf
            WriteToDbf('NTime', 'Buff_NTime', Id_PBKey);
            if Stop then break;
            form.Step;
			InfoQuery.Next;
		end;

	except on e:Exception do
		begin
            form.Close;
			ShowError(e);
			BufTran.Rollback;
			ModalResult := 0;
			Exit;
		end
	end;
	BufTran.Commit;
    form.Close;
    WorkReg.Font.Color := clMaroon;
end;

procedure TAllBuffersForm.moving_dump;
var
  	ID_PBKey: Integer;
    form: TProcessForm;
begin
    if version = 1 then exit;

    form := TProcessForm.Create(Self);
    form.Caption := 'Вигрузка посадових переміщень, зачекайте...';
    form.Show;

	InfoQuery.SQL.Text := 'SELECT * FROM BUFFER_DUMP_NMOVING';

	bufTran.Start;
	try
		InfoQuery.Open;
        InfoQuery.FetchAll;
        form.Progress.Max := InfoQuery.RecordCount;
		InfoQuery.First;

		while not InfoQuery.Eof do
		begin
		  //Id_PBKey := BufTran.AddRecord('NMOVING', 'Buff_NMOVING');
				// запись в буфер Interbase
		  BuffQuery.Close;
		  // Пишем в таблицу транзакций
		  ID_PBKEY := BufTran.AddRecord('NMOVING','BUFF_NMOVING');

                  // пишем буфер ЛТД в наш локальній буфер
		  DecimalSeparator := '.';
		  BuffQuery.SQL.Text := 'EXECUTE PROCEDURE BUFF_ADD_NMOVING(' +
                             IntToStr(ID_PBKEY) + ',' +
                             QuotedStr(TimeToStr(InfoQuery['TIME_IN'])) + ',' +
                             QuotedStr(DateToStr(InfoQuery['DATE_IN'])) + ',' +
                             IntToStr(InfoQuery['ID_MOVING']) + ',' +
                             IntToStr(InfoQuery['ID_MAN']) + ',' +
                             QuotedStr(DateToStr(InfoQuery['DATE_BEG'])) + ',' +
                             QuotedStr(DateToStr(InfoQuery['DATE_END'])) + ',' +
                             IntToStr(InfoQuery['ID_ORDER']) + ',' +
                             IntToStr(1) + ',' +
                             QuotedStr(InfoQuery['DATEORD']) + ',' +
                             IntToStr(InfoQuery['ID_PODRK']) + ',' +
                             IntToStr(InfoQuery['ID_POSTK']) + ',' +
                             QuotedStr(FloatToStr(InfoQuery['KOL_STAVOK'])) + ',' +
                             QuotedStr(FloatToStr(InfoQuery['OKLAD'])) + ',' +
                             QuotedStr(FloatToStr(InfoQuery['TARST'])) + ',' +
                             IntToStr(InfoQuery['ID_TIME']) + ',' +
                             IntToStr(InfoQuery['SHIFT']) + ',' +
                             IntToStr(InfoQuery['IN_SHTAT']) + ',' +
                             IntToStr(InfoQuery['VO_K']) + ',' +
                             IntToStr(InfoQuery['ID_SPZ'])+ ',' +
                             IntToStr(InfoQuery['RMOVING']) + ', 1,' +
                             IntToStr(InfoQuery['BMOVING']) + ',0,0)';
		  ExecQuery(BuffQuery);
		  DecimalSeparator := ',';

			// запись в dbf
			WriteToDbf('NMOVING', 'Buff_NMOVING', Id_PBKey);
            if Stop then break;
            form.Step;
			InfoQuery.Next;
		end;

	except on e:Exception do
		begin
            form.Close;
			ShowError(e);
			BufTran.Rollback;
			ModalResult := 0;
			Exit;
		end
	end;
    form.Close;
	BufTran.Commit;
    moving.Font.Color := clMaroon;
end;


procedure TAllBuffersForm.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TAllBuffersForm.OkButtonClick(Sender: TObject);
begin
    if (TableFast.Checked) and ((MonthEdit.Text = '') or (YearEdit.Text = ''))
    then begin
        MessageDlg('Треба вибрати місяць та рік, за які вигружати табелі!',mtError,[mbOk],0);
        exit;
    end;

    if VO.Checked then VO_DUMP;
    if Departments.Checked then Departments_dump;
    if People.Checked then people_dump;
    if Post.Checked then post_dump;
    if WorkMode.Checked then workmode_dump;
    if Vihod.Checked then vihod_dump;
    if Calendar.Checked then calendar_dump;
    if Table.Checked then
        if TableFast.Checked then new_table_dump
        else table_dump;
    if Hospital.Checked then hospital_dump;
    if Spz.Checked then spz_dump;
    if WorkReg.Checked then workreg_dump;
    if Moving.Checked then moving_dump;
    if MovingSynhronize.Checked then MovingsSynhronizeProc;
    if HolidaySynhronize.Checked then HolidaySynhronizeProc;
    if BonusSynhronize.Checked then BonusSynhronizeProc;
    if OrdersSynhronize.Checked then OrdersSynhronizeProc;
    if WorkModeChange.Checked then WorkModeChangeSync;

    ShowMessage('Вигрузку завершено!');

    if not Consts_Query.Active then
        Consts_Query.Open;

    if not DepNameQuery.Active then
        DepNameQuery.Open;

    if not CurrSRQuery.Active then
        CurrSRQuery.Open;            
end;


procedure TAllBuffersForm.FormCreate(Sender: TObject);
var
    Day, Month, Year : Word;
begin
    BuffQuery.Transaction := PersonalCommon.ReadTransaction;
    InfoQuery.Transaction := PersonalCommon.ReadTransaction;

    Hospital.Visible := not (version = 1);
    Table.Visible := not (version = 1);
    Spz.Visible := not (version = 1);
    WorkReg.Visible := not (version = 1);
    Moving.Visible := not (version = 1);

    DecodeDate(Date, Year, Month, Day);

    MonthEdit.Text := IntToStr(Month);
    YearEdit.Text := IntToStr(Year);

    if Version <> 2 then
    begin
        SyncPanel.Visible := False;
        TablePanel.Visible := False;
        Height := Height - SyncPanel.Height;
        Height := Height - TablePanel.Height;
    end;
end;

procedure TAllBuffersForm.AllCheckedClick(Sender: TObject);
begin
    VO.Checked          := True;
    Departments.Checked := True;
    People.Checked      := True;
    Post.Checked        := True;
    WorkMode.Checked    := True;
    Vihod.Checked       := True;
    Calendar.Checked    := True;
    Table.Checked       := True;
    Hospital.Checked    := True;
    Spz.Checked         := True;
    WorkReg.Checked     := True;
    Moving.Checked      := True;
    MovingSynhronize.Checked := True;
    HolidaySynhronize.Checked := True;
    BonusSynhronize.Checked := True;
    OrdersSynhronize.Checked := True;
    WorkModeChange.Checked := True;
end;

procedure TAllBuffersForm.UnAllCheckedClick(Sender: TObject);
begin
    VO.Checked          := False;
    Departments.Checked := False;
    People.Checked      := False;
    Post.Checked        := False;
    WorkMode.Checked    := False;
    Vihod.Checked       := False;
    Calendar.Checked    := False;
    Table.Checked       := False;
    Hospital.Checked    := False;
    Spz.Checked         := False;
    WorkReg.Checked     := False;
    Moving.Checked      := False;
    MovingSynhronize.Checked := False;
    HolidaySynhronize.Checked := False;
    BonusSynhronize.Checked := False;
    OrdersSynhronize.Checked := False;
    WorkModeChange.Checked := False;
end;

procedure TAllBuffersForm.MovingsSynhronizeProc;
var
	First_PBKey, Last_PBKey, i: Integer;
    sql: String;
begin
    if version = 1 then exit;

	InfoQuery.SQL.Text := 'SELECT * FROM BUFF_SMOVING_FILL';
	try
        WriteTransaction.StartTransaction;
		InfoQuery.Open;
        First_PBKey := InfoQuery['First_IDPBKey'];
        Last_PBKey := InfoQuery['Last_IDPBKey'];


        BufferTable.Close;
        BufferTable.TableName := 'smoving';
        BufferTable.Exclusive := True;
        BufferTable.Open;
        BufferTable.Zap;
        BufferTable.Exclusive := False;
        BufferTable.IndexFiles.Clear;
        BufferTable.IndexFileInclude('smoving.cdx');

		// запись в dbf
        sql := 'SELECT * FROM Buff_SMOVING WHERE Id_PBKey BETWEEN ' +
            IntToStr(First_PBKey) + ' AND ' + IntToStr(Last_PBKey);
        MassWriteToDbf('SMoving', 'Buff_SMoving', sql);

	except on e:Exception do
		begin
			ShowError(e);
			ModalResult := 0;
            BufferTable.Close;
            WriteTransaction.Rollback;
			Exit;
		end
	end;
    MovingSynhronize.Font.Color := clMaroon;
    BufferTable.Close;
    WriteTransaction.Commit;
end;

procedure TAllBuffersForm.HolidaySynhronizeProc;
var
	First_PBKey, Last_PBKey, i: Integer;
    sql: String;
begin
    if version = 1 then exit;

	InfoQuery.SQL.Text := 'SELECT * FROM BUFF_SHOLIDAY_INSERT';
	try
        WriteTransaction.StartTransaction;
		InfoQuery.Open;
        First_PBKey := InfoQuery['First_IDPBKey'];
        Last_PBKey := InfoQuery['Last_IDPBKey'];

        BufferTable.Close;
        BufferTable.TableName := 'sholiday';
        BufferTable.Exclusive := True;
        BufferTable.Open;
        BufferTable.Zap;
        BufferTable.Exclusive := False;
        BufferTable.IndexFiles.Clear;
        BufferTable.IndexFileInclude('sholiday.cdx');

		// запись в dbf
        sql := 'SELECT * FROM Buff_SHOLIDAY WHERE Id_PBKey BETWEEN ' +
            IntToStr(First_PBKey) + ' AND ' + IntToStr(Last_PBKey);

        MassWriteToDbf('SHoliday', 'Buff_SHoliday', sql);

	except on e:Exception do
		begin
			ShowError(e);
			ModalResult := 0;
            BufferTable.Close;
            WriteTransaction.Rollback;
			Exit;
		end
	end;

    HolidaySynhronize.Font.Color := clMaroon;
    BufferTable.Close;
    WriteTransaction.Commit;
end;


procedure TAllBuffersForm.BonusSynhronizeProc;
var
	First_PBKey, Last_PBKey, i: Integer;
    sql: String;
begin
    if version = 1 then exit;

	InfoQuery.SQL.Text := 'SELECT * FROM BUFF_SBONUS_INSERT';
    InfoQuery.Transaction.Commit;
	try
        WriteTransaction.StartTransaction;
		InfoQuery.Open;
        First_PBKey := InfoQuery['First_IDPBKey'];
        Last_PBKey := InfoQuery['Last_IDPBKey'];

        BufferTable.Close;
        BufferTable.TableName := 'sbonus';
        BufferTable.Exclusive := True;
        BufferTable.Open;
        BufferTable.Zap;
        BufferTable.Exclusive := False;
        BufferTable.IndexFiles.Clear;
        BufferTable.IndexFileInclude('sbonus.cdx');

		// запись в dbf
        sql := 'SELECT * FROM Buff_Sbonus WHERE Id_PBKey BETWEEN ' +
            IntToStr(First_PBKey) + ' AND ' + IntToStr(Last_PBKey);

        MassWriteToDbf('SBonus', 'Buff_SBonus', sql);

	except on e:Exception do
		begin
			ShowError(e);
			ModalResult := 0;
            BufferTable.Close;
            WriteTransaction.Rollback;
			Exit;
		end
	end;

    BonusSynhronize.Font.Color := clMaroon;
    BufferTable.Close;
    WriteTransaction.Commit;
end;


procedure TAllBuffersForm.OrdersSynhronizeProc;
var
	First_PBKey, Last_PBKey, i: Integer;
    sql: String;
begin
    if version = 1 then exit;

	InfoQuery.SQL.Text := 'SELECT * FROM BUFF_NORDERS_SYNHRONIZE';

	try
        WriteTransaction.StartTransaction;
		InfoQuery.Open;
        First_PBKey := InfoQuery['First_IDPBKey'];
        Last_PBKey := InfoQuery['Last_IDPBKey'];

        BufferTable.Close;
        BufferTable.TableName := 'norders';
        BufferTable.Exclusive := True;
        BufferTable.Open;
        BufferTable.Zap;
        BufferTable.Exclusive := False;
        BufferTable.IndexFiles.Clear;
        BufferTable.IndexFileInclude('norders.cdx');

		// запись в dbf
        sql := 'SELECT * FROM Buff_Norders WHERE Id_PBKey BETWEEN ' +
            IntToStr(First_PBKey) + ' AND ' + IntToStr(Last_PBKey);

        MassWriteToDbf('NOrders', 'Buff_NOrders', sql);

	except on e:Exception do
		begin
			ShowError(e);
			ModalResult := 0;
            BufferTable.Close;
            WriteTransaction.Rollback;
			Exit;
		end
	end;

    OrdersSynhronize.Font.Color := clMaroon;
    BufferTable.Close;
    WriteTransaction.Commit;
end;

procedure TAllBuffersForm.WorkModeChangeSync;
var
	First_PBKey, Last_PBKey, i: Integer;
    sql: String;
begin
    if version = 1 then exit;

	InfoQuery.SQL.Text := 'SELECT * FROM BUFF_NMODECHG_EXPORT';

	try
        WriteTransaction.StartTransaction;
		InfoQuery.Open;
        First_PBKey := InfoQuery['First_PBKey'];
        Last_PBKey := InfoQuery['Last_PBKey'];

        BufferTable.Close;
        BufferTable.TableName := 'NMODECHG';
        BufferTable.Exclusive := True;
        BufferTable.Open;
        BufferTable.Zap;
        BufferTable.Exclusive := False;
        BufferTable.IndexFiles.Clear;
        BufferTable.IndexFileInclude('NMODECHG.cdx');

		// запись в dbf
        sql := 'SELECT * FROM Buff_NModeChg WHERE Id_PBKey BETWEEN ' +
            IntToStr(First_PBKey) + ' AND ' + IntToStr(Last_PBKey);

        MassWriteToDbf('NModeChg', 'Buff_NModeChg', sql);

	except on e:Exception do
		begin
			ShowError(e);
			ModalResult := 0;
            BufferTable.Close;
            WriteTransaction.Rollback;
			Exit;
		end
	end;

    WorkModeChange.Font.Color := clMaroon;
    BufferTable.Close;
    WriteTransaction.Commit;
end;


procedure TAllBuffersForm.TableFastClick(Sender: TObject);
begin
    if TableFast.Checked then Table.Checked := True;
end;

end.
