dataSource {
	boolean pooled = true
	driverClassName = "com.mysql.jdbc.Driver"
	username = "root"
	password = ""
}
hibernate {
    cache.use_second_level_cache=true
    cache.use_query_cache=true
    cache.provider_class='net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
	development {
		dataSource {
			dbCreate = "update" // one of 'create', 'create-drop','update'
			url = "jdbc:mysql://127.0.0.1:3306/DB_1.7"
		}
	}
	test {                                      // nur fürn testrun
		dataSource {
			dbCreate = "update"
			url = "jdbc:mysql://127.0.0.1:3306/DB_1.7"
		}
	}
	production {
		dataSource {
			dbCreate = "update"
			url = "jdbc:mysql://127.0.0.1:3306/DB_1.7"
		}
	}
}