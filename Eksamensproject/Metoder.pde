int artifact1 = 0;
int artifact2 = 0;
int artifact3 = 0;
int highscore = 0;
int sID;


void GetData()
{
  //Connect to database
  db = new SQLite( this, "saveFiles.sqlite" );

  //If connection is succesfull
  if ( db.connect() )
  {

    //Start kode for select
    //Make Select query
    db.query( "SELECT sID, highScore, arti1, arti2, arti3 FROM saveFile;" );
    //Run through recordset using next()
    while (db.next())
    {
      sID = db.getInt("sID");
      artifact1 = db.getInt("arti1");
      artifact2 = db.getInt("arti2");
      artifact3 = db.getInt("arti3");
      highscore = db.getInt("highScore");
    }
    //Slut kode for select
  } else
  {
    //Display error trying to get data from DB
    println("Error DB");
  }
  db.close();
}

void UpdateData()
{
  //Connect to database
  db = new SQLite( this, "saveFiles.sqlite" );

  //If connection is succesfull
  if ( db.connect() )
  {

    switch(worldCounter) {

    case 1:
      db.query( "UPDATE saveFile SET arti1 = '" +artifact1+ "' WHERE sID = " + sID+ ";");
      break;

    case 2:
      db.query( "UPDATE saveFile SET arti2 = '" +artifact2+ "' WHERE sID = " + sID+ ";");
      break;

    case 3:
      db.query( "UPDATE saveFile SET arti3 = '" +artifact3+ "' WHERE sID = " + sID+ ";");
      break;
    }
  } else
  {
    //Display error trying to get data from DB
    println("Error DB");
  }
  db.close();
}
