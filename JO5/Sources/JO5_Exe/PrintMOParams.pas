unit PrintMOParams;


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, FIBQuery, pFIBQuery,
  pFIBStoredProc, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  cxControls, cxContainer, cxEdit, cxCheckBox, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxMRUEdit, frxClass, frxDBSet, uneTypes, cxSpinEdit,
  frxExportPDF, frxExportImage, frxExportRTF, frxExportXML, frxExportXLS,
  frxExportHTML, frxExportTXT, frxDesgn, ibase, cxRadioGroup;

type

  //Перечисляемый тип для определения типа преобразований
  TEnm_TypeCoversion = ( ctIntToSet, ctSetToInt );

  TfrmGetMOParams = class(TForm)

    dbWork           : TpFIBDatabase;
    trRead           : TpFIBTransaction;
    trWrite          : TpFIBTransaction;
    dstWork          : TpFIBDataSet;
    spcWork          : TpFIBStoredProc;

    btnOK            : TcxButton;
    btnCancel        : TcxButton;

    gbxPeriod        : TGroupBox;

    lblYear          : TLabel;
    lblMonth         : TLabel;

    edtYear          : TcxSpinEdit;
    edtMonth         : TcxMRUEdit;
    frxDS: TfrxDBDataset;
    dstWork_DOT: TpFIBDataSet;
    cxRadioButton1: TcxRadioButton;
    cxRadioButton2: TcxRadioButton;
    frxReport1: TfrxReport;

    procedure FormShortCut              (var Msg: TWMKey; var Handled: Boolean);
    procedure btnOKClick(Sender: TObject);

  public
      fidsystem:Integer;
      constructor Create( AOwner:TComponent; dbHandle:TISC_DB_HANDLE; id_system:Integer ); reintroduce;
      procedure FillMonthList(var aMonthList: TStringList; const aFillMode: TFillMode );

  end;

implementation

uses DateUtils, uneUtils;

{$R *.dfm}

procedure TfrmGetMOParams.FillMonthList(var aMonthList: TStringList; const aFillMode: TFillMode );
var
	i, n : Integer;
begin
    try
        try
            case aFillMode of

              fmInc  : begin
                       end;

              fmDec  : begin
                       end;

              fmFull : begin
                         n := High( cMonthUA );

                         for i := Low( cMonthUA ) to n
                         do begin
                             aMonthList.Add( cMonthUA[i] )
                         end;
                       end;
            end;
        except
            //Протоколируем ИС
        end;
    except
        on E: Exception
        do begin
	      MessageBox( Handle, PChar( sErrorTextExtUA + E.Message ), PChar( sMsgCaptionErrUA ), MB_OK or MB_ICONERROR );
        end;
    end;
end;




constructor TfrmGetMOParams.Create(AOwner:TComponent; dbHandle:TISC_DB_HANDLE; id_system:Integer);
var FillMode    : TFillMode;
    MonthList :TStringList;
    IndexSearch:Integer;
begin
            inherited Create(AOwner );
            Self.fidsystem:=id_system;
            Self.dbWork.Handle:=dbHandle;
            self.trRead.StartTransaction;


            MonthList := TStringList.Create;

            FillMode := fmFull;
            FillMonthList( MonthList, FillMode );
            edtMonth.Properties.LookupItems.AddStrings( MonthList );

            edtYear.Value:=YearOf(Date);
            edtYear.Properties.MinValue := 2011;
            edtYear.Properties.MaxValue := 2050;

            IndexSearch := edtMonth.Properties.LookupItems.IndexOf( cMonthUA[MonthOf( Date ) - 1] );

            if IndexSearch = -1
            then begin
                edtMonth.Text := edtMonth.Properties.LookupItems.Strings[0];
            end
            else begin
                edtMonth.Text := cMonthUA[MonthOf( Date ) - 1]
            end;

end;

procedure TfrmGetMOParams.FormShortCut(var Msg: TWMKey;
  var Handled: Boolean);
begin
  case Msg.CharCode of

    VK_F10 : begin
				           ModalResult := mrOk;
				           Handled := True;
				     end;

	VK_ESCAPE : begin
				           ModalResult := mrCancel;
				           Handled := True;
             end;
  end;
end;




procedure TfrmGetMOParams.btnOKClick(Sender: TObject);
var i,n:Integer;
    pCurrPeriod:TDateTime;
begin
     Screen.Cursor:=crHourGlass;

     //Получаем дату, соответствующую выбранному пользователем периоду
     n := High( cMonthUA );

     for i := Low( cMonthUA ) to n
     do begin
         if edtMonth.Text = cMonthUA[i] then Break;
     end;

     pCurrPeriod := EncodeDate( StrToInt( edtYear.Text ), i + 1, cFIRST_DAY_OF_MONTH );


     if dstWork_DOT.Active then dstWork_DOT.Close;
     dstWork_DOT.SelectSQL.Text:='select * from JO5_GET_MO_TITLE_PARAMS('+''''+DateToStr(pCurrPeriod)+''''+','+IntTostr(self.fidsystem)+')';
     dstWork_DOT.Open;



     if cxRadioButton1.Checked
     then begin
               //отбираем данные по МО
               if dstWork.Active then dstWork.Close;
               dstWork.SelectSQL.Text:='select * from JO5_GET_MO('+''''+DateToStr(pCurrPeriod)+''''+','+IntTostr(self.fidsystem)+',-1) where suma<>0 order by OPER_TEXT';
               dstWork.Open;
     end
     else begin
               //отбираем данные по МО
               if dstWork.Active then dstWork.Close;
               dstWork.SelectSQL.Text:='select * from JO5_GET_MO_D_FULL('+''''+DateToStr(pCurrPeriod)+''''+','+IntTostr(self.fidsystem)+',-1) order by PROGRAM_TEXT, TF_TEXT, smeta_kod asc';
               dstWork.Open;
     end;


     Screen.Cursor:=crDefault;


     if cxRadioButton1.Checked
     then frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Jo5\JO5_MO.fr3')
     else frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Jo5\JO5_MO_D.fr3');

     if cxRadioButton1.Checked
     then begin
               if dstWork_DOT.RecordCount>0
               then begin
                         frxReport1.Variables['organization']     :=''''+dstWork_DOT.FieldByName('name_customer').AsString+'''';
                         frxReport1.Variables['OKPO']             :=''''+dstWork_DOT.FieldByName('kod_edrpou').AsString+'''';
                         frxReport1.Variables['PERIOD']           :=''''+edtMonth.Text+' '+edtYear.Text+'''';
                         frxReport1.Variables['SYS_TITLE']        :=''''+dstWork_DOT.FieldByName('sys_title').AsString+'''';
               end
               else begin
                         frxReport1.Variables['ORGANIZATION']     :='';
                         frxReport1.Variables['OKPO']             :='';
                         frxReport1.Variables['PERIOD']           :='';
               end;
     end
     else begin
               if dstWork_DOT.RecordCount>0
               then begin
                         frxReport1.Variables['PERIOD']           :=''''+edtMonth.Text+' '+edtYear.Text+'''';
               end
               else begin
                         frxReport1.Variables['PERIOD']           :='';
               end;
     end;

     frxReport1.PrepareReport(true);
     frxReport1.ShowPreparedReport;
end;

end.




