unit PCardImportUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, Buttons,Buffer,SpCommon,
  PersonalCommon, Halcn6db;

type
  TPCardImportForm = class(TForm)
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    Label1: TLabel;
    AllPCardsQuery: TIBQuery;
    GetBufInfoQuery: TIBQuery;
    Edit1: TEdit;
    procedure OkButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PCardImportForm: TPCardImportForm;

implementation

{$R *.dfm}

procedure TPCardImportForm.OkButtonClick(Sender: TObject);
var
IdPbKey:Integer;
begin
AllPCardsQuery.Transaction:=PersonalCommon.ReadTransaction;

BufTran.Start;
AllPCardsQuery.Open;
AllPCardsQuery.FetchAll;
AllPCardsQuery.First;

while( not AllPCardsQuery.Eof) do begin

     IdPbKey:=BufTran.AddRecord('Pep_Data','BUFF_PEP_DATA');
		 GetBufInfoQuery.Params.ParamValues['IdPcard']:=
     AllPCardsQuery['ID_PCARD'];
		 GetBufInfoQuery.Params.ParamValues['IdPbKey']:=IdPbKey;
		 GetBufInfoQuery.Params.ParamValues['TUNION']:=
      AllPCardsQuery['T_UNION'];
 		 GetBufInfoQuery.Params.ParamValues['INVALID']:=
      AllPCardsQuery['INVALID'];
     GetBufInfoQuery.Params.ParamValues['PAR_IDMAN']:=
     AllPCardsQuery['ID_MAN'];;
     GetBufInfoQuery.Params.ParamValues['PAR_TN']:=
     AllPCardsQuery['TN'];;
      GetBufInfoQuery.Params.ParamValues['Act']:=1;
     Edit1.Text:=IntToStr(AllPCardsQuery['ID_PCARD']);
    try
    	ExecQuery(GetBufInfoQuery);
	      WriteToDbf('Pep_data','BUFF_PEP_DATA',IdPbKey);

       except on E:Exception do begin
		   MessageDlg('Виникла помилка: "' + E.Message + '"',mtError,[mbOk],0);
		   BufTran.Rollback;
       Exit;
     		end;
        end;
     AllPCardsQuery.Next;
    end;
  BufTran.Commit;
   end;

procedure TPCardImportForm.FormCreate(Sender: TObject);
begin
GetBufInfoQuery.Transaction:=BufferTransaction;
end;

end.
