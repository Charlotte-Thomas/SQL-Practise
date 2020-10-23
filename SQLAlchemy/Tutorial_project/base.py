from sqlalchemy import create_engine 
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker 

engine = create_engine('postgresql://charlottethomas:pass@localhost:5432/firstdb') # SQLAlchemy Engine that will interact with the dockerized PostgreSQL database,
Session = sessionmaker(bind=engine) # a SQLAlchemy ORM session factory bound to this engine,

Base = declarative_base() # and a base class for our classes definitions.

